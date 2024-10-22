import 'package:flutter/material.dart';

Widget footer() {
  return IntrinsicHeight(
    child: Container(
      alignment: Alignment.center,
      color: Colors.black,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: const Text(
        "Connection Lee. Copyright © 2024 Video Tool GUI. All rights reserved.",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 15,
          color: Colors.yellowAccent,
        ),
      ),
    ),
  );
}
