// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:template/data/data_sources/auth/local_auth_ds.dart';

class MobileUploadDataSource {
  Future<String?> createContent({   
    required String path,
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
    final uploadedFile = await http.MultipartFile.fromPath(
      'file',
      path,
      filename: path,
    );
    request.files.add(uploadedFile);
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
