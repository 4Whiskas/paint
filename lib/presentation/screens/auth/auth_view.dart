import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:template/domain/di/global_dependency.dart';

import 'auth_vm.dart';

class AuthView extends StatelessWidget {
  const AuthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AuthViewModel>.reactive(
      viewModelBuilder: () => AuthViewModel(
        authService: context.global.authService,
      ),
      onModelReady: (model) => model.onReady(),
      builder: (context, model, child) {
        return Scaffold();
      },
    );
  }
}
