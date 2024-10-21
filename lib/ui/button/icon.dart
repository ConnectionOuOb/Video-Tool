import '../../style.dart';
import 'package:flutter/material.dart';

Widget iconButtonAction(IconData icon, String tooltip, Function() onPressed) {
  return IconButton(
    alignment: Alignment.center,
    tooltip: tooltip,
    padding: EdgeInsets.zero,
    icon: Icon(
      icon,
      weight: 300,
      grade: -25,
      color: Colors.black,
    ),
    onPressed: onPressed,
  );
}

Widget iconButtonActionOutline(IconData icon, String tooltip, Function() onPressed) {
  return IconButton(
    alignment: Alignment.center,
    tooltip: tooltip,
    padding: EdgeInsets.zero,
    style: buttonStyle(),
    icon: Icon(
      icon,
      weight: 300,
      grade: -25,
      color: Colors.black,
    ),
    onPressed: onPressed,
  );
}
