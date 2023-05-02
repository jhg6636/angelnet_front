import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';

class FileUtils {

  Future<FilePickerResult?> pickImageFile() async {
    return await FilePicker.platform.pickFiles(type: FileType.image);
  }

}