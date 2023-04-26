import 'package:flutter/material.dart';
import "package:emia_flutter_app/page/pets/pet.dart";
import "package:emia_flutter_app/page/session/session.dart";
import 'package:provider/provider.dart';

enum DropDownType { duration, pet }

List<String> durationTypesString = [
  "15 minutes",
  "30 minutes",
  "45 minutes",
  "60 minutes"
];

class DropDown extends StatefulWidget {
  DropDown({super.key, required this.list, required this.type});
  late List<String> list;
  late DropDownType type;
  @override
  State<DropDown> createState() => _DropDown();
}

class _DropDown extends State<DropDown> {
  int _dropDownValue = 0;
  late SessionModel session;
  @override
  void initState() {
    super.initState();
    session = Provider.of<SessionModel>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<int>(
      value: _dropDownValue,
      onChanged: (int? newValue) {
        setState(() {
          _dropDownValue = newValue!;
          if (widget.type == DropDownType.duration) {
            session.setDuration(newValue!);
          } else {
            session.setPet(newValue!);
          }
        });
      },
      items: widget.list.asMap().entries.map((entry) {
        return DropdownMenuItem<int>(
          value: entry.key,
          child: Text(entry.value),
        );
      }).toList(),
    );
  }
}

class InitSession extends StatelessWidget {
  const InitSession({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          const Text(
            'Choose the duration of your focus session',
          ),
          DropDown(list: durationTypesString, type: DropDownType.duration),
          const Text("Choose your pet"),
          DropDown(list: petTypesString, type: DropDownType.pet),
        ]));
  }
}
