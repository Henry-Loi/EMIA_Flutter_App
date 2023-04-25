import 'package:flutter/material.dart';

class InitSession extends StatelessWidget {
  const InitSession({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          const Text(
            'Choose the duration of your focus session',
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text("Choose your pet"),
        ]));
  }
}
