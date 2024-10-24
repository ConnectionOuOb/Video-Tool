import '../../style.dart';
import 'package:flutter/material.dart';

Widget textButtonAction(
  String text,
  Function() onPressed, {
  bool isAlert = false,
  color = Colors.white,
}) {
  return TextButton(
    onPressed: onPressed,
    style: buttonStyle().copyWith(
      backgroundColor: MaterialStateProperty.all(color),
      alignment: Alignment.center,
      padding: MaterialStateProperty.all(
        const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      ),
    ),
    child: Text(text, style: isAlert ? errText : p2),
  );
}

Widget textIconButtonAction(
  IconData icon,
  String text,
  Function() onPressed,
) {
  return TextButton.icon(
    icon: Icon(icon, size: 18),
    onPressed: onPressed,
    style: buttonStyle().copyWith(
      alignment: Alignment.center,
      padding: MaterialStateProperty.all(
        const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      ),
    ),
    label: Text(text, style: p2),
  );
}
