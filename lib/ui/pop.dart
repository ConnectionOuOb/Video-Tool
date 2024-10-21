import '../style.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

showError(BuildContext context, String message) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('error'.tr(), style: errTitle),
        content: Text(message, style: errText),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: buttonStyle().copyWith(
              alignment: Alignment.center,
              padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              ),
            ),
            child: Text('close'.tr(), style: errTitle),
          ),
        ],
      );
    },
  );
}
