import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:paint/gen/locale_keys.g.dart';
import 'package:paint/presentation/theme/app_typography.dart';
import 'package:paint/presentation/widgets/app_text_button.dart';

class ErrorService {
  ErrorService(this._appContext);
  final BuildContext _appContext;

  Future<void> showEror({
    final String? error,
  }) async {
    await showCupertinoDialog(
      context: _appContext,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text(
            LocaleKeys.error.tr(),
            style: AppTypography.sf.s18.w600,
          ),
          content: Text(
            error ?? LocaleKeys.unhadledError.tr(),
            style: AppTypography.sf.w400.s14.black,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: AppTextButton(
                onTap: Navigator.of(context).pop,
                text: 'Ok',
              ),
            ),
          ],
        );
      },
    );
  }
}
