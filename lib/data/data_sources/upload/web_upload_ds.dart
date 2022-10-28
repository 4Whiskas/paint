// ignore: depend_on_referenced_packages
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:template/data/data_sources/auth/local_auth_ds.dart';

class WebUploadDataSource {
  Future<String?> createContent({    
    required Uint8List bytes,
    required String fileName,
  }) async {
    final token = LocalAuthDataSource.session?.token;
    var request = http.MultipartRequest(
      "POST",
      Uri.parse(""), //TODO: implement url
    );
    // request.fields['type'] = type;
    request.headers.addAll({
      'Content-Type': 'multipart/form-data',
      'accept': 'text/plain',
      'Authorization': 'Bearer $token',
    });
    final uploadingFile = http.MultipartFile.fromBytes(
      'file',
      bytes,
      filename: fileName,
    );
    request.files.add(uploadingFile);
    try {
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);
      final String data = response.body;
      return data;
    } catch (e) {
      return null;
    }
  }
}
