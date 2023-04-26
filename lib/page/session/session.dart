import 'package:flutter/material.dart';
import "package:emia_flutter_app/page/session/session_init.dart";
import "package:emia_flutter_app/page/session/session_start.dart";
import 'package:provider/provider.dart';

class SessionModel extends ChangeNotifier {
  int _pet = 0;
  int _duration = 0;

  int get pet => _pet;
  int get duration => _duration;

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
  bool _started = false;
  late List<Widget> _sessionPage;
  late SessionModel session;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    session = Provider.of<SessionModel>(context, listen: false);
    _sessionPage = [
      const InitSession(),
      const StartSession(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      _sessionPage[_started ? 1 : 0],
      TextButton(
        onPressed: () => setState(() {
          _started = !_started;
          if (!_started) {
            //reset state
            session.setPet(0);
            session.setDuration(0);
          }
        }),
        child: _started ? const Text("stop") : const Text("start"),
      )
    ]);
  }
}
