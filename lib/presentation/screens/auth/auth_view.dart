import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:paint/gen/locale_keys.g.dart';
import 'package:pinput/pinput.dart';
import 'package:stacked/stacked.dart';
import 'package:paint/domain/di/global_dependency.dart';
import 'package:paint/gen/assets.gen.dart';
import 'package:paint/gen/colors.gen.dart';
import 'package:paint/presentation/theme/app_typography.dart';

import 'auth_vm.dart';
import 'widgets/pin_button.dart';

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
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.fromLTRB(
              32,
              MediaQuery.of(context).padding.top + 16,
              32,
              MediaQuery.of(context).padding.bottom + 15,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  model.hasAccount ? LocaleKeys.enterPassword.tr() : LocaleKeys.setPassword.tr(),
                  style: AppTypography.sf.s16.w500.black,
                  textAlign: TextAlign.center,
                ),
                if (!model.successLogin) ...[
                  const SizedBox(height: 5),
                  Text(
                    LocaleKeys.wrongPassword.tr(),
                    textAlign: TextAlign.center,
                    style: AppTypography.sf.s14.w400.red,
                  ),
                ],
                const SizedBox(height: 30),
                Pinput(
                  controller: model.pinController,
                  onCompleted: model.onPinFilled,
                  obscureText: true,
                  obscuringCharacter: '*',
                  enabled: false,
                  defaultPinTheme: PinTheme(
                    height: 70,
                    width: 70,
                    textStyle: model.pinController.text.length == 4
                        ? model.successLogin
                            ? AppTypography.sf.cupertinoGreen.w600.s20
                            : AppTypography.sf.red.w600.s20
                        : AppTypography.sf.cupertinoBlue.w600.s20,
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: ColorName.darkGrey,
                        ),
                      ),
                    ),
                  ),
                ),
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxHeight: 430,
                    maxWidth: 270,
                  ),
                  child: GridView(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                    ),
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      for (int index = 0; index < 9; index++)
                        PinButton(
                          onTap: () => model.incrementPin((index + 1).toString()),
                          text: (index + 1).toString(),
                        ),
                      ...[
                        if (model.hasAccount)
                          PinButton(
                            onTap: model.authViaBiometric,
                            child: Assets.icons.faceid.svg(),
                          )
                        else
                          const SizedBox(),
                        PinButton(
                          text: '0',
                          onTap: () => model.incrementPin('0'),
                        ),
                        PinButton(
                          onTap: model.cancelInput,
                          text: 'C',
                          textColor: ColorName.red,
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
