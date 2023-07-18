import 'package:bmi_calc/constants.dart';
import 'package:flutter/material.dart';

class BigBottomButton extends StatelessWidget {
  const BigBottomButton(
      {super.key, required this.onPress, required this.label});

  final void Function()? onPress;
  final String label;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        color: kBottomContainerColor,
        margin: const EdgeInsets.only(top: 8.0),
        padding: const EdgeInsets.only(bottom: 8.0),
        width: double.infinity,
        height: kBottomContainerHeight,
        child: Center(
          child: Text(
            label.toUpperCase(),
            style: kLargeButtonTextStyle,
          ),
        ),
      ),
    );
  }
}
