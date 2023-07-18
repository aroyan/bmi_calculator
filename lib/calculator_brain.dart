import 'dart:math';

import 'package:bmi_calc/constants.dart';

class CalculatorBrain {
  final double height;
  final double weight;

  double _bmi = 0;

  CalculatorBrain({required this.height, required this.weight});

  double calculateBmi() {
    var result = ((weight / pow(height / 10, 2)) * 100).toStringAsFixed(2);
    _bmi = double.parse(result);
    return _bmi;
  }

  String classification() {
    if (_bmi < 18.5) {
      return BMI.underweight.name;
    }

    if (_bmi >= 18.5 && _bmi <= 24.9) {
      return BMI.normal.name;
    }

    if (_bmi >= 25 && _bmi <= 29.9) {
      return BMI.overweight.name;
    }

    if (_bmi >= 30 && _bmi <= 34.9) {
      return BMI.obese.name;
    }

    if (_bmi >= 35) {
      return BMI.severelyObese.name;
    }

    return '';
  }

  String getWords() {
    if (_bmi < 18.5) {
      return 'You are underweight. You should eat more.';
    }

    if (_bmi >= 18.5 && _bmi <= 24.9) {
      return 'You have a normal body weight. Good job!';
    }

    if (_bmi >= 25 && _bmi <= 29.9) {
      return 'You are overweight. You should lose some weight.';
    }

    if (_bmi >= 30 && _bmi <= 34.9) {
      return 'You are obese. You should lose a lot of weight.';
    }

    if (_bmi >= 35) {
      return 'You are severely obese. You should seek medical help.';
    }

    return '';
  }
}



// Underweight: BMI < 18.5
// Normal: BMI 18.5 - 24.9
// Overweight: BMI 25 - 29.9
// Obese: BMI 30 - 34.9
// Severely obese: BMI > 35