import 'package:xiv/consts/constants.dart';

class XIVItem {
  String _id;
  String _job;
  String _icon;
  String _name;
  String _iLvl;

  set setItemID(String u) => _id = u;
  get getItemID => _id;

  set setItemName(String u) => _name = u;
  get getItemName => _name;

  set setItemJob(String u) => _job = u;
  get getItemJob => _job;

  set setItemIcon(String u) => _icon = kUrlNoDash + u;
  get getItemIcon => _icon;

  set setItemiLevel(int u) => _iLvl = u.toString();
  get getItemiLevel => _iLvl;
}