import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  const ResultPage(
      {super.key, required this.result, required this.classification});

  final double result;
  final String classification;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('Result page'),
          Text(result.toString()),
          Text(classification),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              'Re-Calculate',
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
