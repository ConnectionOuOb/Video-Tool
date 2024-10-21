import '../button/text.dart';
import '../../style.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

showConfirm(
  BuildContext context,
  String message,
  Function() onOk, {
  bool isAlert = false,
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: Text(message, style: isAlert ? errText : p2),
        actionsAlignment: MainAxisAlignment.center,
        actionsOverflowButtonSpacing: 10,
        actions: [
          textButtonAction(
            'cancel'.tr(),
            () {
              Navigator.pop(context);
            },
          ),
          textButtonAction(
            'confirm'.tr(),
            onOk,
            isAlert: isAlert,
          ),
        ],
      );
    },
  );
}
