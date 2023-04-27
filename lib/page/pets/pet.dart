import 'package:flutter/material.dart';
import "package:emia_flutter_app/page/pets/cat.dart";
import "package:emia_flutter_app/page/pets/pig.dart";
import "package:emia_flutter_app/page/pets/hamster.dart";

enum PetTypes { cat, hamster, pig }

List<String> petTypesString = ["cat", "hamster", "pig"];

class Pet extends StatelessWidget {
  //dk why cannot const, figure out later
  Pet({super.key, required this.pet});
  final int pet;
  List<Widget> pets = [
    const Cat(),
    const Hamster(),
    const Pig(),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: pets[pet],
    );
  }
}
