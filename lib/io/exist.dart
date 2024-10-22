import 'dart:io';

bool existFile(String path) {
  return File(path).existsSync();
}
