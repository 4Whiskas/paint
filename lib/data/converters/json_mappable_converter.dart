import 'package:chopper/chopper.dart';
import 'package:template/data/models/models.dart';

class JsonMappableConverter extends JsonConverter {
  @override
  Future<Response<ResultType>> convertResponse<ResultType, Item>(
      Response response) async {
    final jsonRes = await super.convertResponse(response);
    return jsonRes.copyWith<ResultType>(body: Mapper.fromMap(jsonRes.body));
  }

  @override
  // all objects should implements toJson method
  Request convertRequest(Request request) {
    if (request.body is String) {
      return request;
    }
    return super.convertRequest(
      request.copyWith(
        body: Mapper.toMap(request.body),
      ),
    );
  }
}
