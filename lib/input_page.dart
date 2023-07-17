import 'package:bmi_calc/gender_button.dart';
import 'package:bmi_calc/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const Color activeCardColor = Color(0xFF1D1E33);
const Color inactiveCardColor = Color(0xFF111328);

class InputPage extends StatefulWidget {
  const InputPage({super.key, required this.title});

  final String title;

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  var selectedGender = '';
  double _currentSliderValue = 20;

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
                          selectedGender = 'mars';
                        });
                      },
                      child: ReusableCard(
                        color: (selectedGender == 'mars')
                            ? activeCardColor
                            : inactiveCardColor,
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
                          selectedGender = 'venus';
                        });
                      },
                      child: ReusableCard(
                        color: (selectedGender == 'venus')
                            ? activeCardColor
                            : inactiveCardColor,
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
                color: activeCardColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'HEIGHT',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white60,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          _currentSliderValue.toString(),
                          style: const TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          'cm',
                        )
                      ],
                    ),
                    Slider(
                      thumbColor: const Color(0xffEB1555),
                      activeColor: Colors.white,
                      inactiveColor: Colors.white24,
                      value: _currentSliderValue,
                      min: 100,
                      max: 200,
                      divisions: 100,
                      label: _currentSliderValue.round().toString(),
                      onChanged: (double value) {
                        setState(() {
                          _currentSliderValue = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            const Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      color: activeCardColor,
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      color: activeCardColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
