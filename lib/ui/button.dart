import 'package:flutter/material.dart';

Widget iconButtonAction(IconData icon, Function() onPressed) {
  return IconButton(
    padding: const EdgeInsets.all(0),
    icon: Icon(
      icon,
      weight: 300,
      grade: -25,
      color: Colors.black,
    ),
    onPressed: onPressed,
  );
}
