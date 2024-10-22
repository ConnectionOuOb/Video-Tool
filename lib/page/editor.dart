import 'package:video_clipper/style.dart';
import 'package:video_clipper/ui/button/icon.dart';

import '../object.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:easy_localization/easy_localization.dart';

class PageEditor extends StatefulWidget {
  const PageEditor({super.key, required this.video});

  final Video video;

  @override
  State<PageEditor> createState() => _PageEditorState();
}

class _PageEditorState extends State<PageEditor> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    _controller = VideoPlayerController.file(
      File(widget.video.path),
    )..initialize().then((_) {
        setState(() {});
      });
    super.initState();
  }

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
                videoPlayer(),
                const SizedBox(height: 10),
                videoControl(),
                const SizedBox(height: 20),
                const Divider(),
                const SizedBox(height: 20),
                videoTool(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget videoPlayer() {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(borderRadius: radius15),
      child: _controller.value.isInitialized
          ? AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            )
          : const CircularProgressIndicator(),
    );
  }

  Widget videoControl() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        iconButtonActionOutline(
          _controller.value.isPlaying ? Icons.pause_outlined : Icons.play_arrow_outlined,
          "",
          () {
            if (_controller.value.isPlaying) {
              _controller.pause();
            } else {
              _controller.play();
            }
            setState(() {});
          },
        )
      ],
    );
  }

  Widget videoTool() {
    return Container();
  }
}
