import 'package:flutter/material.dart';
import 'constants.dart';

class CardContent extends StatelessWidget {
  const CardContent({Key? key, required this.icon, required this.label})
      : super(key: key);
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          label,
          style: labelTextStyle,
        )
      ],
    );
  }
}
