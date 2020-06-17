import 'package:flutter/material.dart';

//enum _part{Body, Bracelets, Earrings, Feet, Hands, Head, Legs, MainHand, Necklace, Ring1, Ring2, Waist}
class XIVGear {
  String _creator;
  String _dye;
  String _id;
  List<dynamic> _materia;

  set setCreator(String u) => _creator = u;
  get getCreator => _creator;

  set setDye(int u) => _dye = u.toString();
  get getDye => _dye;

  set setID(int u) => _id = u.toString();
  get getID => _id;

  set setMateria(List<dynamic> u) => _materia = u;
  get getMateria => _materia;
  get getMateriaCount => _materia.length;
}