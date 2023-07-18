import 'package:bmi_calc/components/big_bottom_button.dart';
import 'package:bmi_calc/constants.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  const ResultPage(
      {super.key,
      required this.result,
      required this.classification,
      required this.suggestion});

  final double result;
  final String classification;
  final String suggestion;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(48, 32, 0, 0),
              alignment: Alignment.centerLeft,
              child: const Text(
                'Your Result',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.fromLTRB(48, 16, 48, 16),
                decoration: BoxDecoration(
                  color: kActiveCardColor,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      classification.toUpperCase(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: colorGenerator(classification),
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      result.toString(),
                      textAlign: TextAlign.center,
                      style: kNumberVeryLargeTextStyle,
                    ),
                    const Column(
                      children: [
                        Text(
                          'Normal BMI range :',
                          textAlign: TextAlign.center,
                          style: kLabelTextStyle,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          '18.5 - 25 kg/m2',
                          style: kBodyTextStyle,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        suggestion,
                        textAlign: TextAlign.center,
                        style: kBodyTextStyle,
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.all(18.0),
                    //   child: ElevatedButton(
                    //     onPressed: () {},
                    //     child: const Text('SAVE RESULT'),
                    //   ),
                    // ) Implement later, so it can save the result to image
                  ],
                ),
              ),
            ),
            BigBottomButton(
                onPress: () {
                  Navigator.of(context).pop();
                },
                label: 'Re-calculate')
          ],
        ),
      ),
    );
  }
}

Color colorGenerator(String s) {
  if (s == BMI.normal.name) {
    return Colors.lightGreenAccent.shade400;
  } else if (s == BMI.underweight.name) {
    return Colors.yellowAccent.shade400;
  } else if (s == BMI.overweight.name) {
    return Colors.yellowAccent.shade400;
  } else if (s == BMI.obese.name) {
    return Colors.red.shade500;
  } else {
    return Colors.red.shade900;
  }
}
