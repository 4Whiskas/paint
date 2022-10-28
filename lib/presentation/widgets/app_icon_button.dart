import 'package:flutter/cupertino.dart';
import 'package:template/gen/assets.gen.dart';

class AppIconButton extends StatelessWidget {
  const AppIconButton({
    Key? key,
    this.onTap,
    required this.icon,
    this.iconColor,
    this.buttonColor,
  }) : super(key: key);

  final VoidCallback? onTap;
  final SvgGenImage icon;
  final Color? iconColor;
  final Color? buttonColor;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onTap,
      padding: const EdgeInsets.all(5),
      minSize: 0,
      color: buttonColor,
      borderRadius: BorderRadius.circular(12),
      child: icon.svg(color: iconColor),
    );
  }
}
