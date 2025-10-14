import 'package:file_picker/file_picker.dart';

class FileRepository {
  Future<FilePickerResult?> pickFile() async {
    final FilePickerResult? file = await FilePicker.platform.pickFiles();
    return file;
  }
}