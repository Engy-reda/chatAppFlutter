import 'package:chat_app/constant/constants.dart';
import 'package:chat_app/model/message.dart';
import 'package:chat_app/widgets/capture_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../widgets/chat_buble.dart';

class ChatPages extends StatelessWidget {
  static String id = 'ChatPages';
  final _controller = ScrollController();
  CollectionReference messages =
      FirebaseFirestore.instance.collection(kCollection);
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;
    return StreamBuilder<QuerySnapshot>(
        stream: messages.orderBy(kCreatedAt, descending: true).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Message> messagesList = [];
            for (int i = 0; i < snapshot.data!.docs.length; i++) {
              messagesList.add(Message.fromJson(snapshot.data!.docs[i]));
            }

            return Scaffold(
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor: kPrimaryColor,
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(kLogo),
                        radius: 25,
                      ),
                      Text("  Scholar Chat",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'Yesteryear')),
                    ],
                  ),
                  centerTitle: true,
                ),
                body: Column(children: [
                  Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        reverse: true,
                        controller: _controller,
                        itemCount: messagesList.length,
                        itemBuilder: (context, index) {
                          return messagesList[index].id == email
                              ? ChatBuble(message: messagesList[index])
                              : ChatBubleForFrind(message: messagesList[index]);
                        }),
                  ),
                  Row(children: [
                    Expanded(
                      flex: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: controller,
                          onSubmitted: (data) {
                            messages.add({
                              kMessage: data,
                              kCreatedAt: DateTime.now(),
                              kId: email,
                            });
                            controller.clear();
                            _controller.animateTo(
                              0,
                              duration: Duration(seconds: 1),
                              curve: Curves.easeIn,
                            );
                          },
                          decoration: InputDecoration(
                              hintText: 'Send Message',
                              suffixIcon: Icon(
                                Icons.send,
                                color: kPrimaryColor,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide:
                                      BorderSide(color: kPrimaryColor))),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CaptureImage()),
                        );

                      },
                     child: Icon(Icons.camera_alt),
                    )
                  ])
                ]));
          } else {
            return Text('loading ......');
          }
        });
  }
}
