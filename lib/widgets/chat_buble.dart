import 'package:chat_app/model/message.dart';
import 'package:flutter/material.dart';

import '../constant/constants.dart';

class ChatBuble extends StatelessWidget {
  const ChatBuble({
   Key?key ,required this.message
  }):super(key: key);
  final Message message ;

  @override
  Widget build(BuildContext context) {
    return Align(
              alignment: Alignment.centerLeft,

      child: Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.symmetric(vertical: 10 , horizontal: 15),
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
              bottomRight: Radius.circular(30)),
        ),
        child: Text(
          message.message,
          style: TextStyle(color: Colors.white , fontSize: 16),
        ),
      ),
    );
  }
}



class ChatBubleForFrind extends StatelessWidget {
  const ChatBubleForFrind({
   Key?key ,required this.message
  }):super(key: key);
  final Message message ;

  @override
  Widget build(BuildContext context) {
    return Align(
              alignment: Alignment.centerRight,

      child: Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.symmetric(vertical: 10 , horizontal: 15),
        decoration: BoxDecoration(
          color: kFriendColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
              bottomLeft: Radius.circular(30)),
        ),
        child: Text(
          message.message,
          style: TextStyle(color: Colors.white , fontSize: 16),
        ),
      ),
    );
  }
}

