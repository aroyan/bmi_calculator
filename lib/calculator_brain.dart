import 'dart:math';

class CalculatorBrain {
  final double height;
  final double weight;

  late double _bmi;

  CalculatorBrain({required this.height, required this.weight});

  double calculateBmi() {
    var result = ((weight / pow(height / 10, 2)) * 100).toStringAsFixed(2);
    _bmi = double.parse(result);
    return _bmi;
  }

  String classification() {
    if (_bmi < 18.5) {
      return 'Underweight';
    }

    if (_bmi >= 18.5 && _bmi <= 24.9) {
      return 'Normal';
    }

    if (_bmi >= 25 && _bmi <= 29.9) {
      return 'Overweight';
    }

    if (_bmi >= 30 && _bmi <= 34.9) {
      return 'Obese';
    }

    if (_bmi >= 35) {
      return 'Severely obese';
    }

    return '';
  }
}



// Underweight: BMI < 18.5
// Normal: BMI 18.5 - 24.9
// Overweight: BMI 25 - 29.9
// Obese: BMI 30 - 34.9
// Severely obese: BMI > 35