import '../object.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class PageEditor extends StatefulWidget {
  const PageEditor({super.key, required this.video});

  final Video video;

  @override
  State<PageEditor> createState() => _PageEditorState();
}

class _PageEditorState extends State<PageEditor> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(widget.video.name),
        ),
        body: const Center(child: Text('Test text')),
      ),
    );
  }
}
