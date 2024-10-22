import 'package:flutter/material.dart';

TextStyle h1 = const TextStyle(fontSize: 23, fontWeight: FontWeight.bold, color: Colors.black);
TextStyle h2 = const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black);
TextStyle h3 = const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.black);
TextStyle h4 = const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.black);
TextStyle p1 = const TextStyle(fontSize: 23, color: Colors.black);
TextStyle p2 = const TextStyle(fontSize: 18, color: Colors.black);
TextStyle p3 = const TextStyle(fontSize: 13, color: Colors.black);
TextStyle p4 = const TextStyle(fontSize: 10, color: Colors.black);
TextStyle errTitle = const TextStyle(fontSize: 18, color: Colors.red, fontWeight: FontWeight.bold);
TextStyle errText = const TextStyle(fontSize: 15, color: Colors.red);

BorderRadius radius15 = BorderRadius.circular(15);

ButtonStyle buttonStyle() {
  return ButtonStyle(
    padding: MaterialStateProperty.all(EdgeInsets.zero),
    shape: MaterialStateProperty.all(
      RoundedRectangleBorder(
        side: const BorderSide(color: Colors.purple),
        borderRadius: BorderRadius.circular(15),
      ),
    ),
  );
}
