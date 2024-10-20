import '../object.dart';
import '../io/local.dart';
import '../frame/footer.dart';
import '../frame/navigator.dart';
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      home: Scaffold(
        appBar: navBar(context, 'project_name'.tr()),
        body: projectList(),
        bottomNavigationBar: footer(),
      ),
    );
  }

  Widget projectList() {
    return projects.isEmpty ? Center(
      child: CircularProgressIndicator(),
    ) : ListView.builder(
      itemCount: projects.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('Project $index'),
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
