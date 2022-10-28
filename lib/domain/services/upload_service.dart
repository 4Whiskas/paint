import 'package:easy_localization/easy_localization.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:image_picker/image_picker.dart';
import 'package:template/data/data_sources/upload/mobile_upload_ds.dart';
import 'package:template/data/data_sources/upload/web_upload_ds.dart';
import 'package:template/domain/services/error_service.dart';
import 'package:template/gen/locale_keys.g.dart';

class UploadService {
  UploadService(
    this._webDs,
    this._mobileDs,
    this._errorService,
  );

  final WebUploadDataSource _webDs;
  final MobileUploadDataSource _mobileDs;
  final ErrorService _errorService;

  Future<String?> uploadFile(PlatformFile file) async {
    if (kIsWeb) {
      if (file.bytes == null) {
        await _errorService.showEror(
          error: LocaleKeys.mediaUploadingError.tr(),
        );
        return null;
      }
      final res = await _webDs.createContent(
        bytes: file.bytes!,
        fileName: file.name,
      );
      if (res == null) {
        await _errorService.showEror(
          error: LocaleKeys.mediaUploadingError.tr(),
        );
      }
      return res;
    } else {
      if (file.path == null) {
        await _errorService.showEror(
          error: LocaleKeys.mediaUploadingError.tr(),
        );
        return null;
      }
      final res = await _mobileDs.createContent(
        path: file.path!,
        fileName: file.name,
      );
      if (res == null) {
        await _errorService.showEror(
          error: LocaleKeys.mediaUploadingError.tr(),
        );
      }
      return res;
    }
  }

  Future<String?> uploadMedia(XFile file) async {
    if (kIsWeb) {
      final bytes = await file.readAsBytes();
      final res = await _webDs.createContent(
        bytes: bytes,
        fileName: file.name,
      );
      if (res == null) {
        await _errorService.showEror(
          error: LocaleKeys.mediaUploadingError.tr(),
        );
      }
      return res;
    } else {
      final res = await _mobileDs.createContent(
        path: file.path,
        fileName: file.name,
      );
      if (res == null) {
        await _errorService.showEror(
          error: LocaleKeys.mediaUploadingError.tr(),
        );
      }
      return res;
    }
  }
}
