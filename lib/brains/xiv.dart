import 'package:flutter/material.dart';
import 'package:xiv/brains/freecompany.dart';
import 'package:xiv/brains/gear.dart';
import 'package:xiv/consts/constants.dart';
export 'package:xiv/brains/gear.dart';
export 'package:xiv/brains/freecompany.dart';
export 'package:xiv/brains/url_handling.dart';

class XIV with ChangeNotifier {
  String _avatar;
  String _bio;
  String _freeCompanyId;
  XIVFreeCompany _freeCompany = XIVFreeCompany();
  XIVGear _gear;
  String _guardianDeity;
  String _id;
  String _name;
  String _nameDay;
  String _portrait;
  String _server;

  set setAvatar(String u) => _avatar = u;
  get getAvatar => _avatar;

  set setBio(String u) => _bio = u;
  get getBio => _bio;

  set setFreeCompanyId(String u) => _freeCompanyId = u;
  get getFreeCompanyId => _freeCompanyId;

  set setFreeCompanyName(String u) => _freeCompany.setName = u;
  get getFreeCompanyActive => _freeCompany.getActive;
  get getFreeCompanyCrest => _freeCompany.getCrest;
  get getFreeCompanyActiveMemberCount => _freeCompany.getActiveMemberCount;
  get getFreeCompanyName => _freeCompany.getName;
  get getFreeCompanyGrandCompany => _freeCompany.getGrandCompany;
  get getFreeCompanyEstateName => _freeCompany.getEstateName;
  get getFreeCompanyPlot => _freeCompany.getEstatePlot;
  get getFreeCompanyGreeting => _freeCompany.getEstateGreeting;
  get getFreeCompanyRank => _freeCompany.getRank;
  get getFreeCompanyTag => _freeCompany.getTag;
  get getFreeCompanySlogan => _freeCompany.getSlogan;

  set setGear(XIVGear u) => _gear = u;
  get getGear => _gear;

  set setGuardianDeity(int u) => _guardianDeity = u.toString();
  get getGuardianDeity => kDeities[_guardianDeity];

  set setNameDay(String u) => _nameDay = u;
  get getNameDay => _nameDay;

  set setID(int u) => _id = u.toString();
  get getID => _id;

  set setName(String u) => _name = u;
  get getName => _name;

  set setPortrait(String u) => _portrait = u;
  get getPortrait => _portrait;

  set setServer(String u) => _server = u;
  get getServer => _server;

  get getPrintableInfo =>
      '\n\n--Character--\nAvatar: $getAvatar\nBio: $getBio\nFreeCompany: $getFreeCompanyId\n'
      'Gear:soon\nDeity: $getGuardianDeity\nID: $getID\nName: $getName\nNameDay: $getNameDay'
      '\nPortrait: $getPortrait\nServer: $getServer';

  void fillVarsCharacter(Map<String, dynamic> map) {
    this._avatar = map['Character']['Avatar'];
    this._bio = map['Character']['Bio'];
    this._freeCompanyId = map['Character']['FreeCompanyId'];

    ///TODO: this._gear
    this._guardianDeity = map['Character']['GuardianDeity'].toString();
    this._nameDay = map['Character']['Nameday'];
    this._portrait = map['Character']['Portrait'];
    this._server = map['Character']['Server'];
    notifyListeners();
  }

  void fillVarsFC(Map<String, dynamic> decoder) {
    /// https://xivapi.com/freecompany/9233645873504816758
    _freeCompany.setActive = decoder['FreeCompany']['Active'];
    _freeCompany.setCrest = decoder['FreeCompany']['Crest'];
    _freeCompany.setActiveMemberCount = decoder['FreeCompany']['ActiveMemberCount'];
    _freeCompany.setEstateName = decoder['FreeCompany']['Estate']['Name'];
    _freeCompany.setEstateGreeting = decoder['FreeCompany']['Estate']['Greeting'];
    _freeCompany.setEstatePlot = decoder['FreeCompany']['Estate']['Plot'];
    _freeCompany.setGrandCompany = decoder['FreeCompany']['GrandCompany'];
    _freeCompany.setName = decoder['FreeCompany']['Name'];
    _freeCompany.setRank = decoder['FreeCompany']['Rank'];
    _freeCompany.setServer = decoder['FreeCompany']['Server'];
    _freeCompany.setSlogan = decoder['FreeCompany']['Slogan'];
    _freeCompany.setTag = decoder['FreeCompany']['Tag'];
    notifyListeners();
  }
}
