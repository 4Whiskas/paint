import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_drawing_board/flutter_drawing_board.dart';
import 'package:paint/presentation/screens/home/enums/paint_tool.dart';
import 'package:stacked/stacked.dart';
import 'package:paint/gen/assets.gen.dart';
import 'package:paint/gen/colors.gen.dart';
import 'package:paint/gen/locale_keys.g.dart';
import 'package:paint/presentation/screens/home/widgets/draw_view.dart';
import 'package:paint/presentation/theme/app_typography.dart';
import 'package:paint/presentation/widgets/app_icon_button.dart';
import 'package:paint/presentation/widgets/app_text_button.dart';

import 'home_vm.dart';
import 'widgets/draw_tools.dart';
import 'widgets/save_tools.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      onModelReady: (model) => model.onReady(),
      builder: (context, model, child) {
        return Navigator(
          pages: [
            CupertinoPage(
              child: Scaffold(
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
              ),
            ),
          ],
          onPopPage: (_, __) => false,
        );
      },
    );
  }
}
