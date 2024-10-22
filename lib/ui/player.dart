import 'button/icon.dart';
import '../style.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:easy_localization/easy_localization.dart';

class VideoPlayerPro extends StatefulWidget {
  const VideoPlayerPro({super.key, required this.videoPath});

  final String videoPath;

  @override
  State<VideoPlayerPro> createState() => _VideoPlayerProState();
}

class _VideoPlayerProState extends State<VideoPlayerPro> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    _controller = VideoPlayerController.file(
      File(widget.videoPath),
    )..initialize().then((_) {
        setState(() {});
      });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        videoPlayer(),
        const SizedBox(height: 10),
        videoControl(),
      ],
    );
  }

  Widget videoPlayer() {
    return InkWell(
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
        decoration: BoxDecoration(borderRadius: radius15),
        child: _controller.value.isInitialized
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              )
            : const CircularProgressIndicator(),
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
        iconButtonActionOutline(
          Icons.replay_30_outlined,
          "${"editor_backward".tr()} 30 ${"editor_second".tr()}",
          () {
            _controller.seekTo(_controller.value.position - const Duration(seconds: 30));
          },
        ),
        iconButtonActionOutline(
          Icons.replay_5_outlined,
          "${"editor_backward".tr()} 5 ${"editor_second".tr()}",
          () {
            _controller.seekTo(_controller.value.position - const Duration(seconds: 5));
          },
        ),
        iconButtonActionOutline(
          Icons.replay_outlined,
          'editor_replay'.tr(),
          () {
            _controller.pause();
            _controller.seekTo(const Duration());
            setState(() {});
          },
        ),
        iconButtonActionOutline(
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
        ),
        iconButtonActionOutline(
          Icons.forward_5_outlined,
          "${"editor_forward".tr()} 5 ${"editor_second".tr()}",
          () {
            _controller.seekTo(_controller.value.position + const Duration(seconds: 5));
          },
        ),
        iconButtonActionOutline(
          Icons.forward_30_outlined,
          "${"editor_forward".tr()} 30 ${"editor_second".tr()}",
          () {
            _controller.seekTo(_controller.value.position + const Duration(seconds: 30));
          },
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }
}
