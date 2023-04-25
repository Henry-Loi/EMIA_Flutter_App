import 'package:flutter/material.dart';

class SessionTimer extends StatefulWidget {
  const SessionTimer({super.key, required this.duration});
  final int duration;

  @override
  State<SessionTimer> createState() => _SessionTimer();
}

class _SessionTimer extends State<SessionTimer> {
  int _duration = 0;

  //add set interval to timer to countdown
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Session Timer'),
    );
  }
}
