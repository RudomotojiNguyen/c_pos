import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';

import '../../common/extensions/extension.dart';

class FilePickerServices {
  final ImagePicker picker = ImagePicker();

  Future<File?> singleFile(
      {FileType type = FileType.any, List<String>? allowedExtensions}) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: type,
      allowedExtensions: allowedExtensions,
    );

    if (result != null) {
      File file = File(result.files.single.path!);
      return file;
    } else {
      return null;
    }
  }

  Future<List<XFile>> multipleFiles(
      {FileType type = FileType.any, List<String>? allowedExtensions}) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: type,
      allowedExtensions: allowedExtensions,
    );

    if (result != null) {
      // List<File> files = result.paths.map((path) => File(path!)).toList();
      // return files;
      List<XFile> xFiles = result.xFiles;
      return xFiles;
    } else {
      return [];
    }
  }

  Future<XFile?> takePicture() async {
    try {
      final XFile? photo = await picker.pickImage(source: ImageSource.camera);
      if (photo != null && photo.mimeType.isNullOrEmpty) {
        return XFile(
          photo.path,
          mimeType: 'image/png',
        );
      }
      return photo;
    } catch (e) {
      return null;
    }
  }

  Future<List<XFile>> getImageFromGallery() async {
    try {
      final List<XFile> images = await picker.pickMultiImage();
      return images.map((e) {
        var newE = e;
        if (newE.mimeType.isNullOrEmpty) {
          // nếu không có type thì set là image
          newE = XFile(
            e.path,
            mimeType: 'image/png',
          );
        }
        return newE;
      }).toList();
    } catch (e) {
      return [];
    }
  }
}
