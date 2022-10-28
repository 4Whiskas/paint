import 'package:chopper/chopper.dart';
import 'package:template/data/data_sources/core/app_remote_ds.dart';
import 'package:template/data/models/models.dart';

part 'remote_auth_ds.chopper.dart';

@ChopperApi(baseUrl: 'security/') //TODO: change url
abstract class RemoteAuthDataSource extends ChopperService
    implements AppRemoteDataSource {
  static RemoteAuthDataSource create([ChopperClient? client]) =>
      _$RemoteAuthDataSource(client);

  @Post(path: 'signIn')
  Future<Response<AuthResultModel>> sigIn(@Body() final SignInDto dto);

  @Post(path: 'signUp')
  Future<Response<AuthResultModel>> signUp(@Body() final SignUpDto dto);
}
