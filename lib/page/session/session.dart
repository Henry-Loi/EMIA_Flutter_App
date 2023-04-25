import 'package:flutter/material.dart';
import "package:emia_flutter_app/page/session/session_init.dart";
import "package:emia_flutter_app/page/session/session_start.dart";

class SessionModel extends ChangeNotifier {
  int _pet = 0;
  int _duration = 0;
  void setPet(int pet) {
    _pet = pet;
    notifyListeners();
  }

  void setDuration(int duration) {
    _duration = duration;
    notifyListeners();
  }
}

class Session extends StatefulWidget {
  const Session({super.key});

  @override
  State<Session> createState() => _Session();
}

class _Session extends State<Session> {
  int _duration = 15 * 60;
  int _pet = 0;
  bool _started = false;
  late List<Widget> _sessionPage;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _sessionPage = [
      const InitSession(),
      StartSession(duration: _duration, pet: _pet),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      _sessionPage[_started ? 1 : 0],
      TextButton(
        onPressed: () => setState(() {
          _started = !_started;
        }),
        child: _started ? const Text("stop") : const Text("start"),
      )
    ]);
  }
}
