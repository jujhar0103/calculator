import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'dart:math';

class Buttons extends StatelessWidget {
  const Buttons({
    required this.callback,
    required this.buttonText,
    required this.userInput,
    super.key,
  });

  final String buttonText;
  final Function(String) callback;
  final String userInput;

  @override
  Widget build(BuildContext context) {
    String alteredInput = userInput;
    final List<String> operator = ['+', '-', '*', '/', '.', '!', '^', 'π', '%'];

    return Material(
      shape: const CircleBorder(),
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          if (operator.contains(buttonText) &&
              operator.contains(userInput.substring(userInput.length - 1))) {
            return;
          }
          if (buttonText == 'C') {
            alteredInput = '';
          } else if (buttonText == '=') {
            Parser p = Parser();
            alteredInput = alteredInput.replaceAll('π', '*$pi');
            alteredInput = alteredInput.replaceAll('%', '*0.01');
            Expression exp = p.parse(alteredInput);
            ContextModel cm = ContextModel();
            double eval = exp.evaluate(EvaluationType.REAL, cm);
            alteredInput = eval.toString();
          } else if (buttonText == 'del') {
            alteredInput = alteredInput.substring(0, (alteredInput.length - 1));
          } else {
            alteredInput = userInput + buttonText;
          }
          callback(alteredInput);
        },
        child: (buttonText == '!' ||
                buttonText == '^' ||
                buttonText == 'π' ||
                buttonText == '%')
            ? Container(
                margin: const EdgeInsets.all(8),
                child: Center(
                  child: Text(
                    buttonText,
                    style: const TextStyle(
                      fontSize: 28,
                      color: Color.fromARGB(203, 224, 224, 224),
                    ),
                  ),
                ),
              )
            : Container(
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: (buttonText == '=')
                      ? const Color.fromARGB(65, 7, 69, 255)
                      : (buttonText == '+' ||
                              buttonText == '-' ||
                              buttonText == '*' ||
                              buttonText == '/' ||
                              buttonText == '(' ||
                              buttonText == ')' ||
                              buttonText == 'C')
                          ? const Color.fromARGB(75, 44, 164, 180)
                          : const Color.fromARGB(158, 48, 50, 62),
                ),
                child: Center(
                  child: (buttonText == 'del')
                      ? const Icon(
                          Icons.backspace,
                          color: Color.fromARGB(203, 224, 224, 224),
                          size: 32,
                        )
                      : Text(
                          buttonText,
                          style: const TextStyle(
                            fontSize: 40,
                            color: Color.fromARGB(203, 224, 224, 224),
                          ),
                        ),
                ),
              ),
      ),
    );
  }
}
