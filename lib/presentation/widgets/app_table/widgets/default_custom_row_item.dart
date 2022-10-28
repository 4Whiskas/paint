
import 'package:flutter/material.dart';

import '../abstract/searched_table_item.dart';

class DefaultCustomRowItem extends SearchedTableItem {
  const DefaultCustomRowItem({
    Key? key,
    required super.title,
    required this.children,
  }) : super(key: key);

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: children,
      ),
    );
  }
}
