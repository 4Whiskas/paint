import 'package:flutter/material.dart';

import 'table_item.dart';

abstract class SearchedTableItem extends TableItem {
  const SearchedTableItem({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context);
}
