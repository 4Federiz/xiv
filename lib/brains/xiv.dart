import 'package:flutter/material.dart';

class XIV with ChangeNotifier{
  String _id;
  String _name;
  String _portrait;
  String _server;

  set setID(int u) =>  _id = u.toString();
  get getID => _id;

  set setName(String u) => _name = u;
  get getName => _name;

  set setPortrait(String u) => _portrait = u;
  get getPortrait => _portrait;

  set setServer(String u) => _server = u;
  get getServer => _server;

//  String getUserID() {
//    return _userID;
//    notifyListeners();
//  }
}