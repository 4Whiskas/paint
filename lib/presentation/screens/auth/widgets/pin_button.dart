import 'package:flutter/cupertino.dart';
import 'package:paint/gen/colors.gen.dart';
import 'package:paint/presentation/theme/app_typography.dart';

class PinButton extends StatelessWidget {
  const PinButton({
    Key? key,
    required this.onTap,
    this.child,
    this.text,
    this.textColor,
  }) : super(key: key);

  final VoidCallback onTap;
  final Widget? child;
  final String? text;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (MediaQuery.of(context).size.width - 160) / 3,
      height: (MediaQuery.of(context).size.width - 160) / 3,
      child: CupertinoButton(
        onPressed: onTap,
        borderRadius: BorderRadius.circular(90),
        color: ColorName.lightGrey,
        padding: EdgeInsets.zero,
        child: child ??
            Text(
              text ?? '',
              style: AppTypography.sf.w500.s18.black.copyWith(color: textColor),
            ),
      ),
    );
  }
}
