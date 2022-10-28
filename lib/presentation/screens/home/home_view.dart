import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'home_vm.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      onModelReady: (model) => model.onReady(),
      builder: (context, model, child) {
        return Scaffold();
      },
    );
  }
}
