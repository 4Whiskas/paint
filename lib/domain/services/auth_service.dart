import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:paint/data/data_sources/auth/local_auth_ds.dart';
import 'package:paint/data/data_sources/core/app_remote_ds.dart';
import 'package:paint/domain/services/core/app_service.dart';
import 'package:paint/gen/locale_keys.g.dart';
import 'package:paint/presentation/app/app.dart';
import 'package:paint/presentation/navigation/app_router.dart';

class AuthService extends AppService<LocalAuthDataSource, BaseRemoteDataSource> {
  AuthService(super.lds, super.rds, super.errorService);

  final LocalAuthentication _localAuthentication = LocalAuthentication();

  AuthState get authState => LocalAuthDataSource.authState.value;

  @override
  Future<void> init() async {
    LocalAuthDataSource.authState.addListener(authStateListener);
    await lds.checkPassword();
  }

  Future<bool> login(String password) async {
    return await lds.checkPassword(password: password);
  }

  Future<void> loginViaBiometrics() async {
    try {
      final res = await _localAuthentication.authenticate(
        localizedReason: LocaleKeys.authReason.tr(),
        options: const AuthenticationOptions(biometricOnly: true),
      );
      if (res == true) {
        await lds.checkPassword(forceAuth: res);
      }
    } on PlatformException catch (e) {
      await errorService.showEror(error: e.message);
    }
  }

  void setPassword(String password) {
    lds.setPassword(password);
  }

  void authStateListener() {
    if (LocalAuthDataSource.authState.value == AuthState.none) {
      App.router.replaceAll(
        [
          const AuthViewRoute(),
        ],
      );
    } else if (App.router.current.name == AuthViewRoute.name) {
      App.router.replaceAll(
        [
          const HomeViewRoute(),
        ],
      );
    }
  }

  @override
  void dispose() {
    LocalAuthDataSource.authState.dispose();
  }
}
