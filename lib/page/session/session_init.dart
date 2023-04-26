import 'package:flutter/material.dart';

class DropDown extends StatefulWidget {
  DropDown({super.key, required this.list});
  late List<String> list;
  @override
  State<DropDown> createState() => _DropDown();
}

class _DropDown extends State<DropDown> {
  late String? _dropDownValue;

  @override
  void initState() {
    super.initState();
    _dropDownValue = widget.list[0];
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: _dropDownValue,
      onChanged: (String? newValue) {
        setState(() {
          _dropDownValue = newValue;
        });
      },
      items: widget.list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
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
          DropDown(list: <String>[
            "15 minutes",
            "30 minutes",
            "45 minutes",
            "60 minutes",
          ]),
          const Text("Choose your pet"),
          DropDown(list: <String>[
            "cat",
            "dog",
            "bird",
            "fish",
            "hamster",
            "rabbit"
          ]),
        ]));
  }
}
