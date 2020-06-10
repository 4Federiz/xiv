import 'package:flutter/material.dart';

enum _bodyPart{Body, Bracelets, Earrings, Feet, Hands, Head, Legs, MainHand, Necklace, Ring1, Ring2, Waist}
class XIVGear with ChangeNotifier{
  /// Implement later with https://xivapi.com/item/29427
  String _creator;
  String _dye;
  String _id;
  List<String> _materia;
}