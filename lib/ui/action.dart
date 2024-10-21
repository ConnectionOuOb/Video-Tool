import 'button.dart';
import '../style.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

showSideMenu(BuildContext context, List<Widget> children) {
  showDialog(
    barrierColor: Colors.transparent,
    context: context,
    builder: (context) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 15, top: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(width: 2, color: Colors.black),
              borderRadius: radius15,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                iconButtonAction(
                  Icons.close_outlined,
                  'home_language'.tr(),
                  () {
                    Navigator.of(context).pop();
                  },
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: children,
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      );
    },
  );
}
