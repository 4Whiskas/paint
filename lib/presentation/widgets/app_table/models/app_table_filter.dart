import 'dart:math';

class AppTableFilter<T> {
  AppTableFilter({
    required this.title,
    required this.querry,
    this.titleBuilder,
  }) {
    id = '${Random().nextInt(1000000)}';
  }

  final String title;
  final String Function()? titleBuilder;
  bool active = false;
  final List<T> Function(List<T> items) querry;
  late final String id;

  String get actualTitle => titleBuilder == null ? title : titleBuilder!();

  void changeActive() {
    active = !active;
  }
}
