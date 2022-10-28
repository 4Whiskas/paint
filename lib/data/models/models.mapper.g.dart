import 'package:dart_mappable/dart_mappable.dart';
import 'package:dart_mappable/internals.dart';

import 'auth/auth_model.dart';
import 'auth/sign_in_mode.dart';
import 'auth/sign_up_model.dart';


// === ALL STATICALLY REGISTERED MAPPERS ===

var _mappers = <BaseMapper>{
  // class mappers
  AuthResultModelMapper._(),
  SignInDtoMapper._(),
  SignUpDtoMapper._(),
  // enum mappers
  // custom mappers
};


// === GENERATED CLASS MAPPERS AND EXTENSIONS ===

class AuthResultModelMapper extends BaseMapper<AuthResultModel> {
  AuthResultModelMapper._();

  @override Function get decoder => decode;
  AuthResultModel decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  AuthResultModel fromMap(Map<String, dynamic> map) => AuthResultModel(token: Mapper.i.$get(map, 'token'));

  @override Function get encoder => (AuthResultModel v) => encode(v);
  dynamic encode(AuthResultModel v) => toMap(v);
  Map<String, dynamic> toMap(AuthResultModel a) => {'token': Mapper.i.$enc(a.token, 'token')};

  @override String stringify(AuthResultModel self) => 'AuthResultModel(token: ${Mapper.asString(self.token)})';
  @override int hash(AuthResultModel self) => Mapper.hash(self.token);
  @override bool equals(AuthResultModel self, AuthResultModel other) => Mapper.isEqual(self.token, other.token);

  @override Function get typeFactory => (f) => f<AuthResultModel>();
}

extension AuthResultModelMapperExtension  on AuthResultModel {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  AuthResultModelCopyWith<AuthResultModel> get copyWith => AuthResultModelCopyWith(this, $identity);
}

abstract class AuthResultModelCopyWith<$R> {
  factory AuthResultModelCopyWith(AuthResultModel value, Then<AuthResultModel, $R> then) = _AuthResultModelCopyWithImpl<$R>;
  $R call({String? token});
  $R apply(AuthResultModel Function(AuthResultModel) transform);
}

class _AuthResultModelCopyWithImpl<$R> extends BaseCopyWith<AuthResultModel, $R> implements AuthResultModelCopyWith<$R> {
  _AuthResultModelCopyWithImpl(AuthResultModel value, Then<AuthResultModel, $R> then) : super(value, then);

  @override $R call({String? token}) => $then(AuthResultModel(token: token ?? $value.token));
}

class SignInDtoMapper extends BaseMapper<SignInDto> {
  SignInDtoMapper._();

  @override Function get decoder => decode;
  SignInDto decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  SignInDto fromMap(Map<String, dynamic> map) => SignInDto(email: Mapper.i.$get(map, 'email'), password: Mapper.i.$get(map, 'password'));

  @override Function get encoder => (SignInDto v) => encode(v);
  dynamic encode(SignInDto v) => toMap(v);
  Map<String, dynamic> toMap(SignInDto s) => {'email': Mapper.i.$enc(s.email, 'email'), 'password': Mapper.i.$enc(s.password, 'password')};

  @override String stringify(SignInDto self) => 'SignInDto(email: ${Mapper.asString(self.email)}, password: ${Mapper.asString(self.password)})';
  @override int hash(SignInDto self) => Mapper.hash(self.email) ^ Mapper.hash(self.password);
  @override bool equals(SignInDto self, SignInDto other) => Mapper.isEqual(self.email, other.email) && Mapper.isEqual(self.password, other.password);

  @override Function get typeFactory => (f) => f<SignInDto>();
}

extension SignInDtoMapperExtension  on SignInDto {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  SignInDtoCopyWith<SignInDto> get copyWith => SignInDtoCopyWith(this, $identity);
}

abstract class SignInDtoCopyWith<$R> {
  factory SignInDtoCopyWith(SignInDto value, Then<SignInDto, $R> then) = _SignInDtoCopyWithImpl<$R>;
  $R call({String? email, String? password});
  $R apply(SignInDto Function(SignInDto) transform);
}

class _SignInDtoCopyWithImpl<$R> extends BaseCopyWith<SignInDto, $R> implements SignInDtoCopyWith<$R> {
  _SignInDtoCopyWithImpl(SignInDto value, Then<SignInDto, $R> then) : super(value, then);

  @override $R call({String? email, String? password}) => $then(SignInDto(email: email ?? $value.email, password: password ?? $value.password));
}

class SignUpDtoMapper extends BaseMapper<SignUpDto> {
  SignUpDtoMapper._();

  @override Function get decoder => decode;
  SignUpDto decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  SignUpDto fromMap(Map<String, dynamic> map) => SignUpDto(email: Mapper.i.$get(map, 'email'), password: Mapper.i.$get(map, 'password'), nickname: Mapper.i.$get(map, 'nickname'));

  @override Function get encoder => (SignUpDto v) => encode(v);
  dynamic encode(SignUpDto v) => toMap(v);
  Map<String, dynamic> toMap(SignUpDto s) => {'email': Mapper.i.$enc(s.email, 'email'), 'password': Mapper.i.$enc(s.password, 'password'), 'nickname': Mapper.i.$enc(s.nickname, 'nickname')};

  @override String stringify(SignUpDto self) => 'SignUpDto(email: ${Mapper.asString(self.email)}, password: ${Mapper.asString(self.password)}, nickname: ${Mapper.asString(self.nickname)})';
  @override int hash(SignUpDto self) => Mapper.hash(self.email) ^ Mapper.hash(self.password) ^ Mapper.hash(self.nickname);
  @override bool equals(SignUpDto self, SignUpDto other) => Mapper.isEqual(self.email, other.email) && Mapper.isEqual(self.password, other.password) && Mapper.isEqual(self.nickname, other.nickname);

  @override Function get typeFactory => (f) => f<SignUpDto>();
}

extension SignUpDtoMapperExtension  on SignUpDto {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  SignUpDtoCopyWith<SignUpDto> get copyWith => SignUpDtoCopyWith(this, $identity);
}

abstract class SignUpDtoCopyWith<$R> {
  factory SignUpDtoCopyWith(SignUpDto value, Then<SignUpDto, $R> then) = _SignUpDtoCopyWithImpl<$R>;
  $R call({String? email, String? password, String? nickname});
  $R apply(SignUpDto Function(SignUpDto) transform);
}

class _SignUpDtoCopyWithImpl<$R> extends BaseCopyWith<SignUpDto, $R> implements SignUpDtoCopyWith<$R> {
  _SignUpDtoCopyWithImpl(SignUpDto value, Then<SignUpDto, $R> then) : super(value, then);

  @override $R call({String? email, String? password, String? nickname}) => $then(SignUpDto(email: email ?? $value.email, password: password ?? $value.password, nickname: nickname ?? $value.nickname));
}


// === GENERATED ENUM MAPPERS AND EXTENSIONS ===




// === GENERATED UTILITY CODE ===

class Mapper {
  Mapper._();

  static MapperContainer i = MapperContainer(_mappers);

  static T fromValue<T>(dynamic value) => i.fromValue<T>(value);
  static T fromMap<T>(Map<String, dynamic> map) => i.fromMap<T>(map);
  static T fromIterable<T>(Iterable<dynamic> iterable) => i.fromIterable<T>(iterable);
  static T fromJson<T>(String json) => i.fromJson<T>(json);

  static dynamic toValue(dynamic value) => i.toValue(value);
  static Map<String, dynamic> toMap(dynamic object) => i.toMap(object);
  static Iterable<dynamic> toIterable(dynamic object) => i.toIterable(object);
  static String toJson(dynamic object) => i.toJson(object);

  static bool isEqual(dynamic value, Object? other) => i.isEqual(value, other);
  static int hash(dynamic value) => i.hash(value);
  static String asString(dynamic value) => i.asString(value);

  static void use<T>(BaseMapper<T> mapper) => i.use<T>(mapper);
  static BaseMapper<T>? unuse<T>() => i.unuse<T>();
  static void useAll(List<BaseMapper> mappers) => i.useAll(mappers);

  static BaseMapper<T>? get<T>([Type? type]) => i.get<T>(type);
  static List<BaseMapper> getAll() => i.getAll();
}

mixin Mappable implements MappableMixin {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);

  @override
  String toString() {
    return _guard(() => Mapper.asString(this), super.toString);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            _guard(() => Mapper.isEqual(this, other), () => super == other));
  }

  @override
  int get hashCode {
    return _guard(() => Mapper.hash(this), () => super.hashCode);
  }

  T _guard<T>(T Function() fn, T Function() fallback) {
    try {
      return fn();
    } on MapperException catch (e) {
      if (e.isUnsupportedOrUnallowed()) {
        return fallback();
      } else {
        rethrow;
      }
    }
  }
}
