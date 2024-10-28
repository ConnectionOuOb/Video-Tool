import 'config.dart';
import 'page/home.dart';
import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  setPathUrlStrategy();

  runApp(
    EasyLocalization(
      supportedLocales: supportedLocales.values.toList(),
      path: 'assets/translations',
      startLocale: supportedLocales.values.first,
      child: const VideoTool(),
    ),
  );
}

class VideoTool extends StatelessWidget {
  const VideoTool({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      home: const PageHome(),
      builder: EasyLoading.init(),
    );
  }
}
