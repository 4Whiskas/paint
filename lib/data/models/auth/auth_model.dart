import 'package:dart_mappable/dart_mappable.dart';

import '../models.mapper.g.dart';

@MappableClass()
class AuthResultModel with Mappable {
  AuthResultModel({
    required this.token,
  });

  final String token;
}
