import '../config.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

PreferredSizeWidget navBar(
  BuildContext context,
  String title,
  Widget child,
) {
  return AppBar(
    title: Text(title),
    actions: supportedLocales.entries
        .map(
          (entry) => Padding(
            padding: const EdgeInsets.only(right: 20),
            child: TextButton(
              onPressed: () {
                context.setLocale(entry.value);
              },
              child: Text(entry.key),
            ),
          ),
        )
        .toList(),
  );
}
