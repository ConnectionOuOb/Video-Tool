import '../object.dart';
import '../ui/player.dart';
import '../frame/footer.dart';
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
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    bool isWide = width > 700;
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
        body: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 10,
            horizontal: width * (isWide ? 0.2 : 0.05),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                VideoPlayerPro(videoPath: widget.video.path),
                const SizedBox(height: 5),
                const Divider(),
                const SizedBox(height: 10),
                videoTool(),
              ],
            ),
          ),
        ),
        bottomNavigationBar: footer(),
      ),
    );
  }

  Widget videoTool() {
    return Container();
  }
}
