import '../../style.dart';
import 'package:flutter/material.dart';

Widget textButtonAction(String text, Function() onPressed, {bool isAlert = false}) {
  return TextButton(
    onPressed: onPressed,
    style: buttonStyle().copyWith(
      alignment: Alignment.center,
      padding: MaterialStateProperty.all(
        const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      ),
    ),
    child: Text(text, style: isAlert ? errText : p2),
  );
}
