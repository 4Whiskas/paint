import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:template/data/data_sources/auth/local_auth_ds.dart';

@immutable
class AuthInterceptor implements RequestInterceptor {
  const AuthInterceptor();

  @override
  Future<Request> onRequest(Request request) async {
    if (LocalAuthDataSource.session != null &&
        LocalAuthDataSource.authState.value == AuthState.authorized) {
      final token = LocalAuthDataSource.session?.token;
      return applyHeaders(
        request,
        {
          'Authorization': 'Bearer $token',
        },
      );
    }
    return request;
  }
}
