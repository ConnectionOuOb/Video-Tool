import '../object.dart';
import '../style.dart';
import '../frame/footer.dart';
import '../ui/button/icon.dart';
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
  bool isHover = false;
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

  Widget videoPlayer() {
    return InkWell(
      onHover: (value) {
        isHover = value;
        setState(() {});
      },
      onTap: () {
        if (_controller.value.isPlaying) {
          _controller.pause();
        } else {
          _controller.play();
        }
        setState(() {});
      },
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: radius15,
          color: Colors.transparent,
        ),
        child: Stack(
          clipBehavior: Clip.antiAlias,
          children: [
            _controller.value.isInitialized
                ? AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  )
                : const CircularProgressIndicator(),
            if (isHover)
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  color: Colors.black.withOpacity(0.7),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTapDown: (details) {
                          final box = context.findRenderObject() as RenderBox;
                          final tapPos = box.globalToLocal(details.globalPosition);
                          final percentage = tapPos.dx / box.size.width;

                          final targetPosition = percentage.clamp(0.0, 1.0);
                          final duration = _controller.value.duration;
                          final newPosition = duration * targetPosition;

                          _controller.seekTo(newPosition);
                        },
                        onHorizontalDragUpdate: (details) {
                          final box = context.findRenderObject() as RenderBox;
                          final tapPos = box.globalToLocal(details.globalPosition);
                          final percentage = tapPos.dx / box.size.width;

                          final targetPosition = percentage.clamp(0.0, 1.0);
                          final duration = _controller.value.duration;
                          final newPosition = duration * targetPosition;

                          _controller.seekTo(newPosition);
                        },
                        child: SizedBox(
                          height: 10,
                          child: VideoProgressIndicator(
                            _controller,
                            allowScrubbing: true,
                            colors: VideoProgressColors(
                              playedColor: Colors.purpleAccent,
                              bufferedColor: Colors.grey.shade400,
                              backgroundColor: Colors.grey.shade300,
                            ),
                            padding: EdgeInsets.zero,
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      videoControl(),
                      const SizedBox(height: 5),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget videoControl() {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      alignment: WrapAlignment.center,
      runAlignment: WrapAlignment.center,
      children: [
        iconButtonAction(
          Icons.replay_30_outlined,
          "${"editor_backward".tr()} 30 ${"editor_second".tr()}",
          () {
            _controller.seekTo(_controller.value.position - const Duration(seconds: 30));
            setState(() {});
          },
          color: Colors.white,
        ),
        iconButtonAction(
          Icons.replay_5_outlined,
          "${"editor_backward".tr()} 5 ${"editor_second".tr()}",
          () {
            _controller.seekTo(_controller.value.position - const Duration(seconds: 5));
            setState(() {});
          },
          color: Colors.white,
        ),
        iconButtonAction(
          Icons.replay_outlined,
          'editor_replay'.tr(),
          () {
            _controller.pause();
            _controller.seekTo(const Duration());
            setState(() {});
          },
          color: Colors.white,
        ),
        iconButtonAction(
          _controller.value.isPlaying ? Icons.pause_outlined : Icons.play_arrow_outlined,
          _controller.value.isPlaying ? 'editor_pause'.tr() : 'editor_play'.tr(),
          () {
            if (_controller.value.isPlaying) {
              _controller.pause();
            } else {
              _controller.play();
            }
            setState(() {});
          },
          color: Colors.white,
        ),
        iconButtonAction(
          Icons.forward_5_outlined,
          "${"editor_forward".tr()} 5 ${"editor_second".tr()}",
          () {
            _controller.seekTo(_controller.value.position + const Duration(seconds: 5));
            setState(() {});
          },
          color: Colors.white,
        ),
        iconButtonAction(
          Icons.forward_30_outlined,
          "${"editor_forward".tr()} 30 ${"editor_second".tr()}",
          () {
            _controller.seekTo(_controller.value.position + const Duration(seconds: 30));
            setState(() {});
          },
          color: Colors.white,
        ),
      ],
    );
  }

  Widget videoTool() {
    return Container();
  }
}
