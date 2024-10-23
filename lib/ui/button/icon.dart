import '../../style.dart';
import 'package:flutter/material.dart';

Widget iconButtonAction(
  IconData icon,
  String tooltip,
  Function() onPressed, {
  color = Colors.black,
}) {
  return IconButton(
    alignment: Alignment.center,
    tooltip: tooltip,
    padding: EdgeInsets.zero,
    icon: Icon(
      icon,
      weight: 300,
      grade: -25,
      color: color,
    ),
    onPressed: onPressed,
  );
}

Widget iconButtonActionOutline(
  IconData icon,
  String tooltip,
  Function() onPressed, {
  color = Colors.white,
}) {
  return IconButton(
    alignment: Alignment.center,
    tooltip: tooltip,
    padding: EdgeInsets.zero,
    style: buttonStyle().copyWith(
      backgroundColor: MaterialStateProperty.all(color),
    ),
    icon: Icon(
      icon,
      weight: 300,
      grade: -25,
      color: Colors.black,
    ),
    onPressed: onPressed,
  );
}
