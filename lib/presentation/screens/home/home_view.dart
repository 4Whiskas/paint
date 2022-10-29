import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:paint/domain/di/user_dependency.dart';
import 'package:paint/gen/assets.gen.dart';
import 'package:paint/gen/colors.gen.dart';
import 'package:paint/gen/locale_keys.g.dart';
import 'package:paint/presentation/screens/home/widgets/draw_view.dart';
import 'package:paint/presentation/theme/app_typography.dart';
import 'package:paint/presentation/widgets/app_icon_button.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

import 'home_vm.dart';
import 'widgets/draw_tools.dart';
import 'widgets/save_tools.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: UserDependency.new,
      dispose: (_, value) => value.dispose(),
      builder: (context, child) => ViewModelBuilder<HomeViewModel>.reactive(
        viewModelBuilder: () => HomeViewModel(
          context.user.galleryService,
        ),
        onModelReady: (model) => model.onReady(),
        builder: (context, model, child) {
          return Scaffold(
            backgroundColor: ColorName.lightGrey,
            appBar: AppBar(
              title: Text(
                LocaleKeys.appName.tr(),
                style: AppTypography.sf.s22.w500.black,
              ),
              actions: [
                AppIconButton(
                  icon: Assets.icons.rollBack,
                  onTap: model.rollBack,
                  iconSize: 22,
                ),
                const SizedBox(width: 10),
                AppIconButton(
                  icon: Assets.icons.rollForward,
                  onTap: model.rollForward,
                  iconSize: 22,
                ),
                const SizedBox(width: 10),
                AppIconButton(
                  onTap: () => model.pickImage(context),
                  icon: Assets.icons.add,
                  iconColor: ColorName.green,
                  iconSize: 22,
                ),
                const SizedBox(width: 10),
              ],
              bottom: const PreferredSize(
                preferredSize: Size.fromHeight(40),
                child: SaveTools(),
              ),
            ),
            body: Stack(
              alignment: Alignment.center,
              children: const [
                DrawView(),
                DrawTools(),
              ],
            ),
          );
        },
      ),
    );
  }
}
