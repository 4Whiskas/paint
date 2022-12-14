import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:paint/data/data_sources/core/app_local_ds.dart';

enum AuthState {
  authorized,
  none,
  passwordNotSet,
}

class LocalAuthDataSource implements AppLocalDataSource {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  final _tokenKey = 'passwordKey';

  static ValueNotifier<AuthState> authState = ValueNotifier(AuthState.none);

  void setPassword(String password) async {
    _storage.write(
      key: _tokenKey,
      value: password,
    );
  }

  Future<bool> checkPassword({
    String? password,
    bool forceAuth = false,
  }) async {
    if (forceAuth) {
      authState.value = AuthState.authorized;
      return true;
    }
    final res = await _storage.read(key: _tokenKey);
    if (res == null) {
      authState.value = AuthState.passwordNotSet;
      return true;
    }
    if (res == password) {
      authState.value = AuthState.authorized;
      return true;
    }
    authState.value = AuthState.none;
    return false;
  }

  Future<void> removeToken() => _storage.deleteAll();
}
