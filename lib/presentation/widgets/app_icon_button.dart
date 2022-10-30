import 'package:flutter/cupertino.dart';
import 'package:paint/gen/assets.gen.dart';

class AppIconButton extends StatelessWidget {
  const AppIconButton({
    Key? key,
    this.onTap,
    this.icon,
    this.iconColor,
    this.buttonColor,
    this.iconSize,
    this.iconWidget,
  }) : super(key: key);

  final VoidCallback? onTap;
  final SvgGenImage? icon;
  final Color? iconColor;
  final Color? buttonColor;
  final double? iconSize;
  final Widget? iconWidget;

  @override
  Widget build(BuildContext context) {
    if (iconWidget == null && icon == null) {
      throw AssertionError(
        'Assertion failed (At least iconWidget must not be null or icon must not be null)',
      );
    }
    return CupertinoButton(
      onPressed: onTap,
      padding: const EdgeInsets.all(5),
      minSize: 0,
      color: buttonColor,
      borderRadius: BorderRadius.circular(12),
      child: iconWidget ??
          icon!.svg(
            color: iconColor,
            width: iconSize,
            height: iconSize,
          ),
    );
  }
}
