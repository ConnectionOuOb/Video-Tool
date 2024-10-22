import '../config.dart';
import '../object.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

Future<List<Video>> videoLoad() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  final List<String> jsonList = prefs.getStringList(localKey) ?? [];

  return jsonList.map((json) => Video.fromJson(jsonDecode(json))).toList();
}

Future<void> videoSave(List<Video> videos) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  final List<String> jsonList = videos.map((v) => jsonEncode(v.toJson())).toList();

  await prefs.setStringList(localKey, jsonList);
}
