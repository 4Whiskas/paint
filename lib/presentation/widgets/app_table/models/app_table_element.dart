import '../abstract/table_item.dart';

class AppTableElement {
  AppTableElement({
    required this.flex,
    required this.child,
  });

  final int flex;
  final TableItem child;
}
