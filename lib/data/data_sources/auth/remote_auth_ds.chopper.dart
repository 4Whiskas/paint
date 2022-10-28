// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_auth_ds.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$RemoteAuthDataSource extends RemoteAuthDataSource {
  _$RemoteAuthDataSource([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = RemoteAuthDataSource;

  @override
  Future<Response<AuthResultModel>> sigIn(SignInDto dto) {
    final String $url = 'security/signIn';
    final $body = dto;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<AuthResultModel, AuthResultModel>($request);
  }

  @override
  Future<Response<AuthResultModel>> signUp(SignUpDto dto) {
    final String $url = 'security/signUp';
    final $body = dto;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<AuthResultModel, AuthResultModel>($request);
  }
}
