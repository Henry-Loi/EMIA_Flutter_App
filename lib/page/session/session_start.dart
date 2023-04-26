import 'dart:async';
import 'package:flutter/material.dart';
import "package:emia_flutter_app/page/pets/pet.dart";
import "package:emia_flutter_app/page/session/session_timer.dart";
import "package:emia_flutter_app/page/session/session.dart";
import 'package:provider/provider.dart';

class StartSession extends StatefulWidget {
  const StartSession({super.key});

  @override
  State<StartSession> createState() => _StartSession();
}

List<int> durationTypes = [15, 30, 45, 60]; // in minutes

class _StartSession extends State<StartSession> {
  late int _timeLeft;
  late Timer _timer;
  late SessionModel session;
  bool finished = false;
  @override
  void initState() {
    super.initState();
    session = Provider.of<SessionModel>(context, listen: false);
    _timeLeft = durationTypes[session.duration] * 60;
    _timer = Timer.periodic(Duration(seconds: 1), (_) {
      setState(() {
        _timeLeft--;
      });
      if (_timeLeft == 0) {
        _timer.cancel();
        finished = true;
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          Text(
            'Time left: ${(_timeLeft / 60).floor()}: ${_timeLeft % 60}',
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          Pet(pet: session.pet),
          Text(finished ? 'Congrats! You finished this session!' : ''),
        ]));
  }
}
