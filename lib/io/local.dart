import '../config.dart';
import '../object.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

Future<List<Project>> projectLoad() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  final List<String> jsonList = prefs.getStringList(localKey) ?? [];

  return jsonList.map((json) => Project.fromJson(jsonDecode(json))).toList();
}

Future<void> projectSave(List<Project> projects) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  final List<String> jsonList = projects.map((project) => jsonEncode(project.toJson())).toList();

  await prefs.setStringList(localKey, jsonList);
}
