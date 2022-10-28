import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:paint/domain/di/core/app_dependency.dart';
import 'package:paint/domain/di/global_dependency.dart';

class UserDependency implements AppDependency {
  UserDependency(BuildContext context) {
    _globalDependency = context.read<GlobalDependency>();
  }

  late final GlobalDependency _globalDependency;
  @override
  void dispose() {
    // TODO: implement dispose
  }
}

extension UserReader on BuildContext {
  UserDependency get user => read<UserDependency>();
}
