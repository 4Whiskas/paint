import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:paint/gen/locale_keys.g.dart';
import 'package:paint/presentation/theme/app_typography.dart';
import 'package:paint/presentation/widgets/app_text_button.dart';

class SelectImageSource extends StatelessWidget {
  const SelectImageSource({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(
        LocaleKeys.chooseImageSource.tr(),
        style: AppTypography.sf.s14.w500.black,
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: AppTextButton(
            text: LocaleKeys.camera.tr(),
            onTap: () => Navigator.of(context).pop(ImageSource.camera),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: AppTextButton(
            text: LocaleKeys.gallery.tr(),
            onTap: () => Navigator.of(context).pop(ImageSource.gallery),
          ),
        ),
      ],
    );
  }
}
