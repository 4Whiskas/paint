import 'package:flutter/cupertino.dart';
import 'package:template/data/data_sources/auth/local_auth_ds.dart';
import 'package:template/data/data_sources/auth/remote_auth_ds.dart';
import 'package:template/data/models/models.dart';
import 'package:template/domain/services/core/app_service.dart';
import 'package:template/presentation/app/app.dart';
import 'package:template/presentation/navigation/app_router.dart';

class AuthService
    extends AppService<LocalAuthDataSource, RemoteAuthDataSource> {
  AuthService(super.lds, super.rds, super.errorService);

  @override
  Future<void> init(BuildContext context) async {
    LocalAuthDataSource.authState.addListener(authStateListener);
  }

  Future<void> login(SignInDto dto) async {
    final res = await rds.sigIn(dto);
    if (res.isSuccessful && res.body == null) {
      lds.saveToken(res.body!);
    } else {
      errorService.showEror();
    }
  }

  void authStateListener() {
    if (LocalAuthDataSource.authState.value == AuthState.none) {
      App.router.replaceAll(
        [
          const AuthViewRoute(),
        ],
      );
    } else {
      if (App.router.current.name == 'AuthViewRoute') {
        App.router.replaceAll(
          [
            const HomeViewRoute(),
          ],
        );
      }
    }
  }

  @override
  void dispose() {
    LocalAuthDataSource.authState.dispose();
  }
}
