import 'package:flutter/material.dart';
import 'package:paint/presentation/theme/app_typography.dart';

import '../abstract/searched_table_item.dart';

class DefaultRowItem extends SearchedTableItem {
  const DefaultRowItem({
    Key? key,
    required super.title,
    this.customStyle,
    this.widget,
  }) : super(key: key);

  final TextStyle? customStyle;
  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: widget ??
          Text(
            title,
            style: customStyle ?? AppTypography.sf.s12,
            textAlign: TextAlign.center,
          ),
    );
  }
}
