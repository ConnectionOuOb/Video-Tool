import 'package:flutter/material.dart';

Widget iconButtonAction(IconData icon, String tooltip, Function() onPressed) {
  return IconButton(
    padding: const EdgeInsets.all(0),
    tooltip: tooltip,
    icon: Icon(
      icon,
      weight: 300,
      grade: -25,
      color: Colors.black,
    ),
    onPressed: onPressed,
  );
}
