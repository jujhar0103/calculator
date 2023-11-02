import 'package:flutter/material.dart';

class Display extends StatelessWidget {
  const Display({required this.display, super.key});

  final String display;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(20),
        height: 250,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: const Color.fromARGB(158, 48, 50, 62),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              (display.length <= 9) ? display : display.substring(0, 9),
              style: const TextStyle(
                fontSize: 72,
                color: Color.fromARGB(203, 224, 224, 224),
              ),
            ),
          ],
        ));
  }
}
