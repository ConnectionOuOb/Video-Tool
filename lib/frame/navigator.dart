import '../config.dart';
import '../style.dart';
import '../ui/action.dart';
import '../ui/button.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

PreferredSizeWidget navBar(BuildContext context, String title, Widget otherAction) {
  return AppBar(
    title: Text(title),
    actions: [
      otherAction,
      const SizedBox(width: 10),
      languageSwitch(context),
      const SizedBox(width: 15),
    ],
  );
}

Widget languageSwitch(BuildContext context) {
  return iconButtonActionOutline(
    Icons.language_rounded,
    'home_language'.tr(),
    () {
      showSideMenu(
        context,
        supportedLocales.entries.map(
          (e) {
            bool isMe = e.value == context.locale;
            return GestureDetector(
              onTap: () {
                context.setLocale(e.value);
                Navigator.of(context).pop();
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                child: Text(
                  e.key,
                  style: (isMe ? p2 : h2).copyWith(
                    decoration: TextDecoration.none,
                    color: isMe ? Colors.black : Colors.grey,
                  ),
                ),
              ),
            );
          },
        ).toList(),
      );
    },
  );
}
