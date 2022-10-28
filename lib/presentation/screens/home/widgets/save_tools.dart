import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:paint/gen/colors.gen.dart';
import 'package:paint/gen/locale_keys.g.dart';
import 'package:paint/presentation/screens/home/home_vm.dart';
import 'package:paint/presentation/widgets/app_text_button.dart';
import 'package:stacked/stacked.dart';

class SaveTools extends ViewModelWidget<HomeViewModel> {
  const SaveTools({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.max,
      children: [
        const SizedBox(
          height: 1,
          width: double.infinity,
          child: ColoredBox(
            color: ColorName.darkGrey,
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: AppTextButton(
                  onTap: () {},
                  text: LocaleKeys.save.tr(),
                ),
              ),
              const SizedBox(
                width: 1,
                height: double.infinity,
                child: ColoredBox(
                  color: ColorName.darkGrey,
                ),
              ),
              Expanded(
                child: AppTextButton(
                  onTap: () {},
                  text: LocaleKeys.saveAll.tr(),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 1,
          width: double.infinity,
          child: ColoredBox(
            color: ColorName.darkGrey,
          ),
        ),
      ],
    );
  }
}
