import 'package:flutter/cupertino.dart';
import 'package:template/presentation/theme/app_typography.dart';

class AppTextButton extends StatelessWidget {
  const AppTextButton({
    Key? key,
    required this.onTap,
    required this.text,
    this.textStyle,
  }) : super(key: key);
  final VoidCallback onTap;
  final String text;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onTap,
      padding: EdgeInsets.zero,
      minSize: 0,
      child: Text(
        text,
        style: textStyle ?? AppTypography.sf.s14.w400.black,
      ),
    );
  }
}
