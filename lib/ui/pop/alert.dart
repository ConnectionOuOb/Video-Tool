import '../button/text.dart';
import '../../style.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

showInfo(BuildContext context, String message, {bool isAlert = false}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          isAlert ? 'error'.tr() : 'info'.tr(),
          style: isAlert ? errTitle : h2,
        ),
        content: Text(message, style: isAlert ? errText : p2),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          textButtonAction(
            'confirm'.tr(),
            () {
              Navigator.pop(context);
            },
            isAlert: isAlert,
          ),
        ],
      );
    },
  );
}
