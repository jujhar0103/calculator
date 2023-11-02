import 'package:flutter/material.dart';
import 'buttons.dart';
import 'display.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() {
    return _CalculatorState();
  }
}

class _CalculatorState extends State<Calculator> {
  String _userInput = '';
  final List<String> buttonText = [
    '!',
    '^',
    'π',
    '%',
    'C',
    '(',
    ')',
    '/',
    '7',
    '8',
    '9',
    '*',
    '4',
    '5',
    '6',
    '-',
    '1',
    '2',
    '3',
    '+',
    '0',
    '.',
    'del',
    '=',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Display(display: _userInput),
        Expanded(
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
            ),
            itemCount: buttonText.length,
            itemBuilder: (ctx, index) => Buttons(
              userInput: _userInput,
              buttonText: buttonText[index],
              callback: (newText) {
                setState(() {
                  _userInput = newText;
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}
