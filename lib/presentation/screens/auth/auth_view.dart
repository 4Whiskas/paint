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
              16,
              MediaQuery.of(context).padding.top + 32,
              16,
              MediaQuery.of(context).padding.bottom + 36,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  model.hasAccount ? LocaleKeys.enterPassword.tr() : LocaleKeys.setPassword.tr(),
                  style: AppTypography.sf.s24.w500.black,
                  textAlign: TextAlign.center,
                ),
                if (!model.successLogin) ...[
                  const SizedBox(height: 5),
                  Text(
                    LocaleKeys.wrongPassword.tr(),
                    textAlign: TextAlign.center,
                    style: AppTypography.sf.s18.w400.red,
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
                SizedBox(
                  height: 300,
                  width: MediaQuery.of(context).size.width - 120,
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                    ),
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 9,
                    itemBuilder: (_, index) {
                      final value = (index + 1).toString();
                      return PinButton(
                        onTap: () => model.incrementPin(value),
                        text: value,
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width - 120,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        if (model.faceIdAvailavle || model.touchIdAvailable) ...[
                          PinButton(
                            onTap: () => model.incrementPin('0'),
                            child: model.faceIdAvailavle ? Assets.icons.faceid.svg() : Assets.icons.touchid.svg(),
                          ),
                          const SizedBox(width: 20),
                        ],
                        PinButton(
                          text: '0',
                          onTap: () => model.incrementPin('0'),
                        ),
                        const SizedBox(width: 20),
                        PinButton(
                          onTap: model.cancelInput,
                          text: 'C',
                          textColor: ColorName.red,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
