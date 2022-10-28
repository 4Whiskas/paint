import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:paint/presentation/theme/app_typography.dart';

import '../abstract/searched_table_item.dart';

class DefaultTimeItem extends SearchedTableItem {
  const DefaultTimeItem({
    Key? key,
    required this.date,
    required super.title,
  }) : super(key: key);

  final DateTime? date;

  String? get day => date == null ? null : DateFormat('dd.MM.yy').format(date!);
  String? get time => date == null ? null : DateFormat('hh:mm').format(date!);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              day ?? '',
              style: AppTypography.sf.s12,
              textAlign: TextAlign.center,
            ),
            Text(
              time ?? '',
              style: AppTypography.sf.s12.grey,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ],
    );
  }
}
