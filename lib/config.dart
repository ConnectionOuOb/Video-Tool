import 'package:flutter/material.dart';

// # Local
String localKey = "projects";

// # Program
String dirBinWindows = "assets/bin/Windows_x64";

// # Format
List<String> supportedExtensions = ["mp4", "mkv", "avi", "mov", "flv", "wmv", "webm"];

// # Program
List<String> programWindows = [
  "ffmpeg.exe",
  "avcodec-61.dll",
  "avdevice-61.dll",
  "avfilter-10.dll",
  "avformat-61.dll",
  "avutil-59.dll",
  "postproc-58.dll",
  "swresample-5.dll",
  "swscale-8.dll",
];

// # Language
const Map<String, Locale> supportedLocales = {
  "中文": Locale('zh', 'TW'),
  "English": Locale('en', 'US'),
};
