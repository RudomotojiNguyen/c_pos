import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ImageDetailModel {
  String? uuid;
  int? id;
  String? fileName;
  Uint8List? data;
  XFile? imageLocal;

  ImageDetailModel({
    this.uuid,
    this.id,
    this.fileName,
    this.data,
    this.imageLocal,
  });

  ImageDetailModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fileName = json['fileName'];
  }

  String get getFileName => fileName ?? '';

  String get getTag => "tag$id";

  GalleryItemModel get convertGalleryItemModel => GalleryItemModel(
        id: getTag,
        data: data,
        type: checkType,
        name: fileName ?? '',
        mimetype: '',
        resource: imageLocal?.path,
      );

  bool get checkHasData =>
      (data != null && data!.isNotEmpty) || (id != null && fileName != null);

  bool get isSelectImage => imageLocal != null;

  GalleryType get checkType {
    if (data != null && data!.isNotEmpty) {
      return GalleryType.data;
    }
    if (imageLocal != null) {
      return GalleryType.file;
    }
    return GalleryType.network;
  }
}

enum GalleryType { asset, network, data, file }

class GalleryItemModel {
  GalleryItemModel({
    required this.id,
    this.resource,
    required this.type,
    required this.name,
    required this.mimetype,
    this.data,
  });

  final String id;
  final String? resource;
  final String name;
  final String mimetype;
  final GalleryType type;
  final Uint8List? data;

  ImageProvider get getImageProvider {
    if (type == GalleryType.network) {
      return NetworkImage(resource!);
    }
    if (type == GalleryType.data) {
      return MemoryImage(data!);
    }
    if (type == GalleryType.file) {
      return FileImage(File(resource!));
    }
    return AssetImage(resource!);
  }

  bool get checkHasData {
    if (type == GalleryType.data) {
      return data != null && data!.isNotEmpty;
    }
    if (type == GalleryType.network) {
      return resource != null && resource!.isNotEmpty;
    }
    if (type == GalleryType.file) {
      return resource != null && resource!.isNotEmpty;
    }
    return false;
  }
}
