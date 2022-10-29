import 'dart:io';

import 'package:flutter/services.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:paint/data/data_sources/core/app_local_ds.dart';

class LocalGalleryDataSource extends AppLocalDataSource {
  Future<void> saveImage({
    required String path,
    required Uint8List data,
  }) async {
    final file = File(path);
    await file.writeAsBytes(data);
    await GallerySaver.saveImage(file.path);
  }
}
