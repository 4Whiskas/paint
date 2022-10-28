// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_push_ds.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$RemotePushDataSource extends RemotePushDataSource {
  _$RemotePushDataSource([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = RemotePushDataSource;

  @override
  Future<Response<AuthResultModel>> setToken(String token) {
    final String $url = 'push/setToken';
    final $body = token;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<AuthResultModel, AuthResultModel>($request);
  }
}
