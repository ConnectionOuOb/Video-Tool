import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';

Future<void> copyFile(String from, String to, {bool doChmod = false}) async {
  try {
    final bytes = await rootBundle.load(from);

    final file = File(to);

    await file.create(recursive: true);
    await file.writeAsBytes(
      bytes.buffer.asUint8List(
        bytes.offsetInBytes,
        bytes.lengthInBytes,
      ),
    );

    if (doChmod) {
      await Process.run('chmod', ['+x', to]);
    }
  } catch (e) {
    debugPrint(e.toString());
  }
}
