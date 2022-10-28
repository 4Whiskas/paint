import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:paint/data/data_sources/auth/local_auth_ds.dart';
import 'package:paint/data/data_sources/core/app_remote_ds.dart';
import 'package:paint/domain/di/core/app_dependency.dart';
import 'package:paint/domain/services/auth_service.dart';
import 'package:paint/domain/services/error_service.dart';

class GlobalDependency implements AppDependency {
  GlobalDependency(BuildContext context) {
    _errorService = ErrorService(context);
    final authLds = LocalAuthDataSource();
    _authService = AuthService(authLds, BaseRemoteDataSource(), _errorService);
  }

  late final AuthService _authService;
  late final ErrorService _errorService;

  AuthService get authService => _authService;
  ErrorService get errorService => _errorService;

  @override
  void dispose() {
    _authService.dispose();
  }
}

extension GlobalReader on BuildContext {
  GlobalDependency get global => read<GlobalDependency>();
}
