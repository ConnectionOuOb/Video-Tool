import 'package:file_picker/file_picker.dart';

Future<String> selectSingleFilePath(List<String> extensions) async {
  List<PlatformFile> selectFiles = await selectExtFiles(extensions);

  return selectFiles.isEmpty ? '' : selectFiles.first.path ?? "";
}

Future<List<PlatformFile>> selectExtFiles(List<String> extensions) async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowMultiple: false,
    allowCompression: false,
    allowedExtensions: extensions,
  );

  if (result == null) return [];

  return result.files;
}
