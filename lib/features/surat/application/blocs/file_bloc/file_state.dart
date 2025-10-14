import 'package:file_picker/file_picker.dart';

sealed class FileState {}

class Initial extends FileState {}

class Loading extends FileState {}

class Loaded extends FileState {
  final FilePickerResult file;
  Loaded(this.file);
}

class Error extends FileState {
  final String message;
  Error(this.message);
}
