import 'package:flutter/cupertino.dart';
import 'package:template/data/data_sources/core/app_local_ds.dart';
import 'package:template/data/data_sources/core/app_remote_ds.dart';
import 'package:template/domain/services/error_service.dart';

abstract class AppService<Local extends AppLocalDataSource,
    Remote extends AppRemoteDataSource> {
  AppService(this.lds, this.rds, this.errorService);

  final Local lds;
  final Remote rds;
  final ErrorService errorService;

  Future<void> init(BuildContext context);
  void dispose();
}
