import 'package:flutter/material.dart';

class CostomButton extends StatelessWidget {
  CostomButton({this.onTap, required this.text});
  VoidCallback? onTap;
  String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: Colors.white),
        child: Center(child: Text(text)),
      ),
    );
  }
}
