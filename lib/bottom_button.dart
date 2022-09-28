import 'package:flutter/material.dart';
import 'constants.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({
    Key? key,
    required this.btnLabel,
    required this.onPress,
  }) : super(key: key);
  final String btnLabel;
  final VoidCallback onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Center(
        child: Container(
          padding: const EdgeInsets.only(bottom: 20.0),
          alignment: Alignment.center,
          color: bottomContainerColor,
          margin: const EdgeInsets.only(top: 10),
          width: double.infinity,
          height: bottomContainerHeight,
          child: Text(
            btnLabel,
            style: kLargeButtonTextStyle,
          ),
        ),
      ),
    );
  }
}
