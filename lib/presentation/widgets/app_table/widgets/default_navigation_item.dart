import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:template/presentation/theme/app_typography.dart';

import '../abstract/table_item.dart';

class DefaultNavigationItem extends TableItem {
  const DefaultNavigationItem({
    Key? key,
    this.title,
    required this.navigationFunc,
  }) : super(key: key);

  final VoidCallback navigationFunc;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: navigationFunc,
      padding: EdgeInsets.zero,
      minSize: 0,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          if (title != null) ...[
            Text(
              title!,
              style: AppTypography.sf.s14,
            ),
            const SizedBox(width: 5),
          ],
          const Icon(
            Icons.arrow_forward_ios,
            size: 15,
          ),
        ],
      ),
    );
  }
}
