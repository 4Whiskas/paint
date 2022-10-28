import 'package:paint/data/data_sources/core/app_local_ds.dart';
import 'package:paint/data/data_sources/core/app_remote_ds.dart';
import 'package:paint/domain/services/error_service.dart';

abstract class AppService<Local extends AppLocalDataSource,
    Remote extends AppRemoteDataSource> {
  AppService(this.lds, this.rds, this.errorService);

  final Local lds;
  final Remote rds;
  final ErrorService errorService;

  Future<void> init();
  void dispose();
}
