import 'editor.dart';
import '../style.dart';
import '../config.dart';
import '../object.dart';
import '../io/exist.dart';
import '../io/local.dart';
import '../io/picker.dart';
import '../frame/footer.dart';
import '../frame/navigator.dart';
import '../ui/pop/alert.dart';
import '../ui/pop/confirm.dart';
import '../ui/button/icon.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class PageHome extends StatefulWidget {
  const PageHome({super.key});

  @override
  State<PageHome> createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  List<Video> videos = [];

  @override
  void initState() {
    loadVideos();

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
        appBar: navBar(
          context,
          'project_name'.tr(),
          videoCreate(),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 10,
            horizontal: width * (isWide ? 0.2 : 0.05),
          ),
          child: videos.isEmpty
              ? Text(
                  'home_video_recent_no'.tr(),
                  style: h2,
                )
              : videoList(),
        ),
        bottomNavigationBar: footer(),
      ),
    );
  }

  Widget videoCreate() {
    return iconButtonActionOutline(
      Icons.add,
      'home_video_new'.tr(),
      () {
        selectSingleFilePath(supportedExtensions).then((value) {
          if (value.isEmpty) {
            showInfo(context, 'home_video_not_select'.tr(), isAlert: true);
            return;
          }

          if (videos.any((element) => element.path == value)) {
            showInfo(context, 'home_video_exist'.tr(), isAlert: true);
            return;
          }

          videos.add(
            Video(
              name: value.split(Platform.pathSeparator).last,
              path: value,
            ),
          );

          videoSave(videos);

          setState(() {});
        });
      },
    );
  }

  Widget videoList() {
    return ListView.builder(
      itemCount: videos.length,
      itemBuilder: (context, index) {
        return videoItem(videos[index]);
      },
    );
  }

  Widget videoItem(Video p) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: ListTile(
        title: Text(p.name, style: h2),
        subtitle: Text(p.path, style: p2),
        contentPadding: const EdgeInsets.symmetric(vertical: 7, horizontal: 20),
        shape: RoundedRectangleBorder(
          borderRadius: radius15,
          side: const BorderSide(color: Colors.purple),
        ),
        trailing: IconButton(
          style: buttonStyle(),
          icon: const Icon(Icons.delete, color: Colors.red),
          onPressed: () {
            showConfirm(
              context,
              "home_video_delete_confirm".tr(),
              () {
                deleteVideo(p);
                Navigator.pop(context);
              },
              isAlert: true,
            );
          },
        ),
        onTap: () {
          if (!existFile(p.path)) {
            showInfo(context, 'home_video_not_exist'.tr(), isAlert: true);
            deleteVideo(p);
            return;
          }

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PageEditor(video: p),
            ),
          );
        },
      ),
    );
  }

  Future<void> loadVideos() async {
    videos = await videoLoad();

    setState(() {});
  }

  Future<void> deleteVideo(Video p) async {
    videos.remove(p);
    await videoSave(videos);
    setState(() {});
  }
}
