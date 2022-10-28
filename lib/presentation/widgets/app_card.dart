import 'package:flutter/material.dart';
import 'package:paint/gen/colors.gen.dart';

class AppCard extends StatelessWidget {
  const AppCard({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color:  ColorName.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            offset: Offset(2, 2),
            blurRadius: 16,
            color: Color.fromRGBO(
              186,
              186,
              186,
              .25,
            ),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 36, 20, 24),
        child: child,
      ),
    );
  }
}
