import 'config.dart';
import 'io/copy.dart';
import 'page/home.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:path_provider/path_provider.dart';
import 'package:easy_localization/easy_localization.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  setPathUrlStrategy();
  init();

  runApp(
    EasyLocalization(
      supportedLocales: supportedLocales,
      path: 'assets/translations',
      startLocale: supportedLocales.first,
      child: const VideoTool(),
    ),
  );
}

class VideoTool extends StatelessWidget {
  const VideoTool({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'project_name'.tr(),
      debugShowCheckedModeBanner: false,
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      home: const PageHome(),
    );
  }
}

void init() async {
  dirExec = (await getTemporaryDirectory()).path;

  for (FileSystemEntity e in Directory(dirBinWindows).listSync()) {
    if (e is File) {
      String fileName = e.path.split(Platform.pathSeparator).last;
      await copyFile(
        '$dirBinWindows/$fileName',
        '$dirExec/$fileName',
      );
    }
  }
}
