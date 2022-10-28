import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hsvcolor_picker/flutter_hsvcolor_picker.dart';
import 'package:paint/gen/colors.gen.dart';
import 'package:paint/gen/locale_keys.g.dart';
import 'package:paint/presentation/theme/app_typography.dart';
import 'package:paint/presentation/widgets/app_text_button.dart';

class SelectColorDialog extends StatefulWidget {
  const SelectColorDialog({
    Key? key,
    required this.inputColor,
  }) : super(key: key);
  final Color inputColor;

  @override
  _SelectColorDialogState createState() => _SelectColorDialogState();
}

class _SelectColorDialogState extends State<SelectColorDialog> {
  Color selectedColor = ColorName.black;
  @override
  void initState() {
    selectedColor = widget.inputColor;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(
        LocaleKeys.selectColor.tr(),
        style: AppTypography.sf.s18.w400.cupertinoBlue,
      ),
      content: HSVPicker(
        color: HSVColor.fromColor(selectedColor),
        onChanged: (value) {
          setState(() {
            selectedColor = value.toColor();
          });
        },
      ),
      actions: [
        SizedBox(
          height: 40,
          child: AppTextButton(
            text: LocaleKeys.cancel.tr(),
            textStyle: AppTypography.sf.s16.w400.red,
            onTap: () => Navigator.of(context).pop(),
          ),
        ),
        SizedBox(
          height: 40,
          child: AppTextButton(
            text: LocaleKeys.accept.tr(),
            textStyle: AppTypography.sf.s16.w400.cupertinoBlue,
            onTap: () => Navigator.of(context).pop(selectedColor),
          ),
        ),
      ],
    );
  }
}
