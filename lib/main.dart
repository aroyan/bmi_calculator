import 'package:bmi_calc/input_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xFF0a0c21),
        ),
        scaffoldBackgroundColor: const Color(0xFF0a0c21),
      ),
      home: const InputPage(title: 'BMI Calculator'),
    );
  }
}
