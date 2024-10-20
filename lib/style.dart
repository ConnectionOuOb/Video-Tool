import 'package:flutter/material.dart';

ButtonStyle buttonStyle() {
  return ButtonStyle(
    padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
    shape: MaterialStateProperty.all(
      RoundedRectangleBorder(
        side: const BorderSide(color: Colors.purple),
        borderRadius: BorderRadius.circular(15),
      ),
    ),
  );
}
