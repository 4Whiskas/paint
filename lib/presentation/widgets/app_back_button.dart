import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:paint/gen/colors.gen.dart';
import 'package:paint/presentation/app/app.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({
    Key? key,
    this.onTap,
    this.color,
  }) : super(key: key);

  final VoidCallback? onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onTap ?? App.router.pop,
      padding: const EdgeInsets.all(5),
      minSize: 0,
      borderRadius: BorderRadius.circular(12),
      child: Icon(
        Icons.arrow_back_ios,
        color: color ?? ColorName.black,
      ),
    );
  }
}
