import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:template/gen/colors.gen.dart';

import '../abstract/table_item.dart';

class DefaultEditDeleteItem extends TableItem {
  const DefaultEditDeleteItem({
    Key? key,
    required this.deleteFunc,
    required this.editFunc,
  }) : super(key: key);

  final VoidCallback deleteFunc;
  final VoidCallback editFunc;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CupertinoButton(
          onPressed: editFunc,
          padding: EdgeInsets.zero,
          minSize: 0,
          child: const Icon(
            Icons.edit_outlined,
            color: ColorName.grey,
            size: 15,
          ),
        ),
        const SizedBox(width: 10),
        CupertinoButton(
          onPressed: deleteFunc,
          padding: EdgeInsets.zero,
          minSize: 0,
          child:  const Icon(
            Icons.close,
            color: ColorName.red,
            size: 15,
          ),
        ),
      ],
    );
  }
}
