import '../style.dart';
import '../config.dart';
import '../object.dart';
import '../io/local.dart';
import '../io/picker.dart';
import '../frame/footer.dart';
import '../frame/navigator.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class PageHome extends StatefulWidget {
  const PageHome({super.key});

  @override
  State<PageHome> createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  List<Project> projects = [];

  @override
  void initState() {
    loadProjects();

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
        appBar: navBar(context, 'project_name'.tr()),
        body: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 10,
            horizontal: width * (isWide ? 0.2 : 0.05),
          ),
          child: projects.isEmpty ? projectCreate() : projectList(),
        ),
        bottomNavigationBar: footer(),
      ),
    );
  }

  Widget projectCreate() {
    return Center(
      child: TextButton(
        style: buttonStyle(),
        onPressed: () async {
          String selectFilePath = await selectSingleFilePath(supportedExtensions);

          projects.add(
            Project(
              name: selectFilePath.split(Platform.pathSeparator).last,
              path: selectFilePath,
            ),
          );

          projectSave(projects);

          setState(() {});
        },
        child: Text('home_project_new'.tr()),
      ),
    );
  }

  Widget projectList() {
    return ListView.builder(
      itemCount: projects.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(projects[index].name, style: h2),
          subtitle: Text(projects[index].path, style: p2),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Scaffold(
                  appBar: navBar(context, 'project_name'.tr()),
                  body: Center(
                    child: Text('Project $index'),
                  ),
                  bottomNavigationBar: footer(),
                ),
              ),
            );
          },
        );
      },
    );
  }

  Future<void> loadProjects() async {
    projects = await projectLoad();

    setState(() {});
  }
}
