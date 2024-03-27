import 'package:flutter/material.dart';



class CustomTextField extends StatelessWidget {
   CustomTextField({this.onchange, this.hintText , this.obscureText = false});
   Function(String)? onchange;
  String? hintText ;
  bool? obscureText ;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText!,
      validator:(data){
        if(data!.isEmpty){
          return'feild is required';

        }
      } ,
      onChanged: onchange,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.white,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          )
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white
          )
        )
      ),
    );
  }
}

// class CustomTextField extends StatelessWidget {
//    CustomTextField({this.hintText});
//   String? hintText;

//   @override
//   Widget build(BuildContext context) {
//     return  
//   }
// }



