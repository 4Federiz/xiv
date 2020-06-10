import 'package:flutter/material.dart';
import 'package:xiv/brains/freecompany.dart';
import 'package:xiv/brains/gear.dart';
export 'package:xiv/brains/gear.dart';
export 'package:xiv/brains/freecompany.dart';
export 'package:xiv/brains/url_handling.dart';

class XIV with ChangeNotifier{
  /// https://xivapi.com/character/23134108
  String _avatar;
  String _bio;
  String _freeCompanyId;
  XIVFreeCompany _freeCompany;
  XIVGear _gear;
  String _guardianDeity;
  String _id;
  String _name;
  String _nameDay;
  String _portrait;
  String _server;

  set setAvatar(String u) =>  _avatar = u;
  get getAvatar => _avatar;

  set setBio(String u) =>  _bio = u;
  get getBio => _bio;

  set setFreeCompanyId(String u) =>  _freeCompanyId = u;
  get getFreeCompanyId => _freeCompanyId;

  get getFreeCompany => _freeCompany;

  set setGear(XIVGear u) =>  _gear = u;
  get getGear => _gear;

  set setGuardianDeity(int u) =>  _guardianDeity = u.toString();
  get getGuardianDeity => _guardianDeity;

  set setNameDay(String u) =>  _nameDay = u;
  get getNameDay => _nameDay;

  set setID(int u) =>  _id = u.toString();
  get getID => _id;

  set setName(String u) => _name = u;
  get getName => _name;

  set setPortrait(String u) => _portrait = u;
  get getPortrait => _portrait;

  set setServer(String u) => _server = u;
  get getServer => _server;

  get getPrintableInfo => 'Avatar: $getAvatar\nBio: $getBio\nFreeCompany: $getFreeCompanyId\n'
      'Gear:soon\nDeity: $getGuardianDeity\nID: $getID\nName: $getName\nNameDay: $getNameDay'
      '\nPortrait: $getPortrait\nServer: $getServer';

  void fillVarsCharacter(Map<String, dynamic> map) {
    this._avatar = map['Character']['Avatar'];
    this._bio = map['Character']['Bio'];
    this._freeCompanyId = map['Character']['FreeCompanyId'];
//    this._freeCompany = XIVFreeCompany(this._freeCompanyId);
    ///TODO: this._gear
    this._guardianDeity = map['Character']['GuardianDeity'].toString();
    this._nameDay = map['Character']['Nameday'];
    this._portrait = map['Character']['Portrait'];
    this._server = map['Character']['Server'];

    notifyListeners();
  }
}