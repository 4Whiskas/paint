import 'package:dart_mappable/dart_mappable.dart';

import '../models.mapper.g.dart';

@MappableClass()
class SignInDto with Mappable {
  SignInDto({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;
}