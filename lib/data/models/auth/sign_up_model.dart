import 'package:dart_mappable/dart_mappable.dart';

import '../models.mapper.g.dart';

@MappableClass()
class SignUpDto with Mappable {
  SignUpDto({
    required this.email,
    required this.password,
    required this.nickname,
  });

  final String email;
  final String password;
  final String nickname;
}
