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

import '../ui/button.dart';
import '../ui/pop.dart';
import 'editor.dart';

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
        appBar: navBar(
          context,
          'project_name'.tr(),
          projectCreate(),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 10,
            horizontal: width * (isWide ? 0.2 : 0.05),
          ),
          child: projects.isEmpty
              ? Text(
                  'home_project_recent_no'.tr(),
                  style: h2,
                )
              : projectList(),
        ),
        bottomNavigationBar: footer(),
      ),
    );
  }

  Widget projectCreate() {
    return iconButtonActionOutline(
      Icons.add,
      'home_project_new'.tr(),
      () {
        selectSingleFilePath(supportedExtensions).then((value) {
          if (value.isEmpty) {
            showError(context, 'home_project_not_select'.tr());
            return;
          }

          if (projects.any((element) => element.path == value)) {
            showError(context, 'home_project_exist'.tr());
            return;
          }

          projects.add(
            Project(
              name: value.split(Platform.pathSeparator).last,
              path: value,
            ),
          );

          projectSave(projects);

          setState(() {});
        });
      },
    );
  }

  Widget projectList() {
    return ListView.builder(
      itemCount: projects.length,
      itemBuilder: (context, index) {
        return projectItem(projects[index]);
      },
    );
  }

  Widget projectItem(Project p) {
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
            projects.remove(p);

            projectSave(projects);

            setState(() {});
          },
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PageEditor(project: p),
            ),
          );
        },
      ),
    );
  }

  Future<void> loadProjects() async {
    projects = await projectLoad();

    setState(() {});
  }
}
