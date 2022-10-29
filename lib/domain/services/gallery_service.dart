import 'package:flutter/services.dart';
import 'package:paint/data/data_sources/core/app_remote_ds.dart';
import 'package:paint/data/data_sources/gallery/local_gallery_ds.dart';
import 'package:paint/domain/services/core/app_service.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

class GalleryService extends AppService<LocalGalleryDataSource, BaseRemoteDataSource> {
  GalleryService(super.lds, super.rds, super.errorService);

  @override
  Future<void> init() async {}

  Future<void> saveImage({
    Uint8List? image,
    required ByteData? art,
  }) async {
    final artByteList = art?.buffer.asUint8List();
    Uint8List newImage = Uint8List.fromList(
      [
        ...artByteList ?? [],
        ...image ?? [],
      ],
    );
    final dir = await getExternalStorageDirectory();
    if (dir == null) {
      errorService.showEror();
      return;
    }
    final path = '${dir.path}${const Uuid().v4()}.jpg';
    try {
      await lds.saveImage(path: path, data: newImage);
    } catch (_) {
      errorService.showEror();
    }
  }

  @override
  void dispose() {}
}
