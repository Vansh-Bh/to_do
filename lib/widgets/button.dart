import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  VoidCallback onPressed;
  Color? color;
  Color? textColor;
  double? width;

  MyButton(
      {super.key,
      required this.text,
      required this.onPressed,
      this.color,
      this.textColor,
      this.width});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 44),
      child: SizedBox(
        height: 50,
        width: width,
        child: MaterialButton(
          shape: const RoundedRectangleBorder(
            side: BorderSide(color: Colors.black),
            borderRadius: SmoothBorderRadius.all(
              SmoothRadius(cornerRadius: 20, cornerSmoothing: 1),
            ),
          ),
          elevation: 0,
          onPressed: onPressed,
          color: color,
          child: Text(
            text,
            style: TextStyle(color: textColor),
          ),
        ),
      ),
    );
  }
}
