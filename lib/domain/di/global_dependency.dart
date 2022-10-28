import 'package:chopper/chopper.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:template/data/converters/json_mappable_converter.dart';
import 'package:template/data/data_sources/auth/local_auth_ds.dart';
import 'package:template/data/data_sources/auth/remote_auth_ds.dart';
import 'package:template/data/data_sources/upload/mobile_upload_ds.dart';
import 'package:template/data/data_sources/upload/web_upload_ds.dart';
import 'package:template/data/interceptors/auth_interceptor.dart';
import 'package:template/domain/di/core/app_dependency.dart';
import 'package:template/domain/services/auth_service.dart';
import 'package:template/domain/services/error_service.dart';
import 'package:template/domain/services/upload_service.dart';

class GlobalDependency implements AppDependency {
  GlobalDependency(BuildContext context) {
    _errorService = ErrorService(context);
    final authLds = LocalAuthDataSource();
    final authRds = RemoteAuthDataSource.create(_chopper);
    _authService = AuthService(authLds, authRds, _errorService);
    _authService.init(context);
    final uploadWds = WebUploadDataSource();
    final uploadMds = MobileUploadDataSource();
    _uploadService = UploadService(uploadWds, uploadMds, _errorService);
  }

  final ChopperClient _chopper = ChopperClient(
    baseUrl: '', //TODO: change url
    converter: JsonMappableConverter(),
    errorConverter: JsonMappableConverter(),
    interceptors: [
      const AuthInterceptor(),
    ],
  );

  late final AuthService _authService;
  late final ErrorService _errorService;
  late final UploadService _uploadService;

  AuthService get authService => _authService;
  ErrorService get errorService => _errorService;
  UploadService get uploadService => _uploadService;
  ChopperClient get chopper => _chopper;

  @override
  void dispose() {
    _authService.dispose();
  }
}

extension GlobalReader on BuildContext {
  GlobalDependency get global => read<GlobalDependency>();
}
