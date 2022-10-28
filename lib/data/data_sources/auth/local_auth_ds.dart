import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:template/data/data_sources/core/app_local_ds.dart';
import 'package:template/data/models/models.dart';

enum AuthState { authorized, none }

class LocalAuthDataSource implements AppLocalDataSource {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  final _tokenKey = 'authToken';

  static ValueNotifier<AuthState> authState = ValueNotifier(AuthState.none);
  static AuthResultModel? session;

  void saveToken(AuthResultModel model) async {
    session = model;
    final json = model.toJson();
    authState.value = AuthState.authorized;
    _storage.write(key: _tokenKey, value: json);
  }

  Future<void> readToken() async {
    final res = await _storage.read(key: _tokenKey);
    if (res == null) {
      authState.value = AuthState.none;
      return;
    }
    authState.value = AuthState.authorized;
    session = Mapper.fromJson(res);
  }

  Future<void> removeToken() => _storage.deleteAll();
}
