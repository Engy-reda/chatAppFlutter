import 'package:chat_app/constant/constants.dart';
import 'package:chat_app/pages/chat_page.dart';
import 'package:chat_app/pages/register_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../helper/show_snackbar.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_textfelid.dart';


class LoginPages extends StatefulWidget {
   LoginPages({super.key});

 


  @override
  State<LoginPages> createState() => _LoginPagesState();
}

class _LoginPagesState extends State<LoginPages> {
    bool isLoading = false;
   GlobalKey<FormState> loginKey = GlobalKey();
  String? email , password ;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Form(
            key: loginKey,
            child: ListView(
              children: [
               SizedBox(
                    height: 75,
                  ),
                CircleAvatar(
                  backgroundImage: AssetImage("images/message.jpeg" ) ,
                  radius: 90,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Scholar Chat" , style: TextStyle( color: Colors.white , fontSize:  32 , fontFamily: 'Yesteryear')),
                  ],
                ),
                    SizedBox(
                    height: 65,
                  ),
                Row(
                  children: [
                    Text("LOGIN" , style: TextStyle( color: Colors.white , fontSize:  16)),
                  ],
                ),
                SizedBox(height: 15,),
              
                CustomTextField(
                  onchange: (data){
                    email = data;
                  },
                  hintText: "Email",),
                SizedBox(height: 15,),
              
                CustomTextField(
                  obscureText: true,
                  onchange: (data){
                    password = data ;
                  },
                  hintText: "Password",),
                SizedBox(height: 15,),
              
                CostomButton(
                  onTap: () async {
                    if (loginKey.currentState!.validate()) {
                      isLoading = true;
                      setState(() {
                        
                      });
                      try {
                        await loginUser();
                        Navigator.pushNamed(context , ChatPages.id , arguments: email);
                        showSnackBar(context, 'sucess');
                      }  on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          showSnackBar(context, 'No user found for that email.');
                        } else if (e.code == 'wrong-password') {
                          showSnackBar(context,
                              'Wrong password provided for that user.');
                        }
                      }catch(ex){
                        showSnackBar(context, 'there was an error');
                      }
                      isLoading = false;
                      setState(() {
                        
                      });
                   
                    }
                  },

                  text: 'LOGIN',),
                SizedBox(height: 15,),
              
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("dont\'t have an acount ?" , style: TextStyle(
                      color: Colors.white
                    ),),
                    GestureDetector(
                      onTap:(){ 
                        Navigator.push(
                          context, 
                          MaterialPageRoute(
                            builder: (context){
                              return  RegisterPage();
                              },),
                              );},
                      child: Text("  Register" , style: TextStyle(
                        color: Color(0xffc7ede6)
                      ),),
                    ),
                  ],
                ),
                SizedBox(
                    height: 75,
                  ),
                  
                
              ],
            ),
          ),
        ),
      ),
    );
  }

 

  Future<void> loginUser() async {
    var auth = FirebaseAuth.instance;
    UserCredential user = await auth.signInWithEmailAndPassword(
        email: email!, password: password!);
  }
  
}

