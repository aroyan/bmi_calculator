import 'package:flutter/material.dart';

class GenderButton extends StatelessWidget {
  const GenderButton({super.key, required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 72.0,
        ),
        const SizedBox(
          height: 16.0,
        ),
        Text(
          label.toUpperCase(),
          style: const TextStyle(fontSize: 20.0),
        ),
      ],
    );
  }
}
