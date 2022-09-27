import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ReusableCard extends StatelessWidget {
  ReusableCard(
      {Key? key, required this.color, required this.widget, this.onPress})
      : super(key: key);
  final Color color;
  final Widget widget;
  VoidCallback? onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: widget,
      ),
    );
  }
}
