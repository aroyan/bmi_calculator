import 'package:bmi_calc/components/big_bottom_button.dart';
import 'package:bmi_calc/calculator_brain.dart';
import 'package:bmi_calc/components/circle_icon_button.dart';
import 'package:bmi_calc/components/gender_button.dart';
import 'package:bmi_calc/screens/result_page.dart';
import 'package:bmi_calc/components/reusable_card.dart';
import 'package:bmi_calc/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({super.key, required this.title});

  final String title;

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? _selectedGender;
  double _height = 100;
  double _weight = 40;

  int _age = 17;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedGender = Gender.male;
                        });
                      },
                      child: ReusableCard(
                        color: (_selectedGender == Gender.male)
                            ? kActiveCardColor
                            : kInactiveCardColor,
                        child: const GenderButton(
                          icon: FontAwesomeIcons.mars,
                          label: 'Male',
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedGender = Gender.female;
                        });
                      },
                      child: ReusableCard(
                        color: (_selectedGender == Gender.female)
                            ? kActiveCardColor
                            : kInactiveCardColor,
                        child: const GenderButton(
                          icon: FontAwesomeIcons.venus,
                          label: 'Female',
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                color: kActiveCardColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'HEIGHT',
                      style: kLabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          _height.toString(),
                          style: kNumberTextStyle,
                        ),
                        const Text(
                          'cm',
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          inactiveTrackColor: const Color(0xFF8D8E98),
                          activeTrackColor: Colors.white,
                          thumbColor: const Color(0xFFEB1555),
                          overlayColor: const Color(0x29EB1555),
                          thumbShape: const RoundSliderThumbShape(
                            enabledThumbRadius: 16.0,
                          ),
                          overlayShape: const RoundSliderOverlayShape(
                            overlayRadius: 30.0,
                          )),
                      child: Slider(
                        value: _height,
                        min: 100,
                        max: 200,
                        divisions: 100,
                        label: _height.round().toString(),
                        onChanged: (double newValue) {
                          setState(() {
                            _height = newValue;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      color: kActiveCardColor,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "WEIGHT",
                            style: kLabelTextStyle,
                          ),
                          Text(
                            _weight.toStringAsFixed(0),
                            style: kNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleIconButton(
                                onPress: () {
                                  setState(() {
                                    _weight--;
                                  });
                                },
                                icon: FontAwesomeIcons.minus,
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              CircleIconButton(
                                onPress: () {
                                  setState(() {
                                    _weight++;
                                  });
                                },
                                icon: FontAwesomeIcons.plus,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      color: kActiveCardColor,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "AGE",
                            style: kLabelTextStyle,
                          ),
                          Text(
                            _age.toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleIconButton(
                                onPress: () {
                                  setState(() {
                                    _age--;
                                  });
                                },
                                icon: FontAwesomeIcons.minus,
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              CircleIconButton(
                                onPress: () {
                                  setState(() {
                                    _age++;
                                  });
                                },
                                icon: FontAwesomeIcons.plus,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            BigBottomButton(
                label: 'calculate',
                onPress: () {
                  CalculatorBrain calculatorBrain =
                      CalculatorBrain(height: _height, weight: _weight);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultPage(
                        result: calculatorBrain.calculateBmi(),
                        suggestion: calculatorBrain.getWords(),
                        classification: calculatorBrain.classification(),
                      ),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
