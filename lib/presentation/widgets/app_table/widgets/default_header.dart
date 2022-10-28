import 'package:flutter/material.dart';
import 'package:paint/presentation/theme/app_typography.dart';

import '../abstract/table_item.dart';

class DefaultTableHeader extends TableItem {
  const DefaultTableHeader({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        title,
        style: AppTypography.sf.s12.w600.black,
        textAlign: TextAlign.center,
      ),
    );
  }
}
