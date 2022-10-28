import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:template/data/data_sources/push/remote_push_ds.dart';
import 'package:template/domain/di/core/app_dependency.dart';
import 'package:template/domain/di/global_dependency.dart';
import 'package:template/domain/services/push_notifications_service.dart';

class UserDependency implements AppDependency {
  UserDependency(BuildContext context) {
    _globalDependency = context.read<GlobalDependency>();
    final pushRds = RemotePushDataSource.create(_globalDependency.chopper);
    _pushNotificationsService = PushNotificationsService(
      FirebaseMessaging.instance,
      pushRds,
    );
    _pushNotificationsService.init();
  }

  late final GlobalDependency _globalDependency;
  late final PushNotificationsService _pushNotificationsService;
  @override
  void dispose() {
    // TODO: implement dispose
  }
}

extension UserReader on BuildContext {
  UserDependency get user => read<UserDependency>();
}
