import 'package:flutter/material.dart';

class CircleIconButton extends StatelessWidget {
  const CircleIconButton(
      {super.key, required this.onPress, required this.icon});

  final void Function()? onPress;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPress,
      elevation: 0.0,
      constraints: const BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: const CircleBorder(),
      fillColor: const Color(0xFF4C4F5E),
      child: Icon(icon),
    );
  }
}
