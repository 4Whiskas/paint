import 'package:flutter/cupertino.dart';
import 'package:template/gen/assets.gen.dart';
import 'package:template/presentation/theme/app_typography.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    Key? key,
    required this.onTap,
    required this.text,
    this.textStyle,
    this.icon,
    this.buttonColor,
    this.borderRadius,
  }) : super(key: key);
  final VoidCallback onTap;
  final String text;
  final TextStyle? textStyle;
  final SvgGenImage? icon;
  final Color? buttonColor;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onTap,
      padding: const EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 15,
      ),
      minSize: 0,
      borderRadius: BorderRadius.circular(borderRadius ?? 12),
      color: buttonColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (icon != null) ...[
            icon!.svg(),
            const SizedBox(width: 5),
          ],
          Text(
            text,
            style: textStyle ?? AppTypography.sf.s16.w500.black,
          ),
        ],
      ),
    );
  }
}
