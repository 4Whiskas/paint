import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:paint/gen/locale_keys.g.dart';
import 'package:paint/presentation/theme/app_typography.dart';
import 'package:paint/presentation/widgets/app_text_button.dart';

class DifferenceDialog extends StatelessWidget {
  const DifferenceDialog({
    Key? key,
    required this.before,
    required this.after,
  }) : super(key: key);
  final Uint8List before;
  final Uint8List after;

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(
        LocaleKeys.beforeAfter.tr(),
        style: AppTypography.sf.s16.w500.black,
      ),
      content: Column(
        children: [
          SizedBox(
            height: 160,
            width: 160,
            child: Image.memory(
              before,
              fit: BoxFit.contain,
            ),
          ),
          const Icon(CupertinoIcons.arrow_down),
          SizedBox(
            height: 160,
            width: 160,
            child: Image.memory(
              after,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: AppTextButton(
            onTap: Navigator.of(context).pop,
            text: LocaleKeys.nice.tr(),
          ),
        ),
      ],
    );
  }
}
