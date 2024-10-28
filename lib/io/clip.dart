import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

Future<String> clipVideo(String inputPath, String dirOutput, String start, String end) async {
  final String dirTemp = (await getApplicationCacheDirectory()).path;
  final String timeStart = start.split(".")[0].replaceAll(":", "-");
  final String timeEnd = end.split(".")[0].replaceAll(":", "-");
  final String fileName = "${path.basenameWithoutExtension(inputPath)}.${timeStart}_$timeEnd";
  final String outputName = "$fileName${path.extension(inputPath)}";

  final List<String> args = [
    '-y',
    '-i',
    inputPath,
    '-ss',
    start,
    '-to',
    end,
    '-c',
    'copy',
    path.join(dirOutput, outputName),
  ];

  final result = await Process.run(
    "$dirTemp/ffmpeg.exe",
    args,
  );

  if (result.exitCode != 0) {
    return result.stderr.toString();
  }

  return "";
}
