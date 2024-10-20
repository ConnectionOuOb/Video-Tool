import '../frame/footer.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../frame/nav.dart';

class PageHome extends StatefulWidget {
  const PageHome({super.key});

  @override
  State<PageHome> createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      home: Scaffold(
        appBar: navBar(context, 'project_name'.tr(), const Text('Home')),
        body: const Center(child: Text('Test text')),
        bottomNavigationBar: footer(),
      ),
    );
  }
}
