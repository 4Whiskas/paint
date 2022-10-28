import 'package:flutter/material.dart';

abstract class TableItem extends StatelessWidget {
  const TableItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context);
}
