import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:xiv/brains/url_handling.dart';

class XIVFreeCompany with ChangeNotifier{
  /// https://xivapi.com/freecompany/9233645873504816758

  UrlHandling json = UrlHandling();
  String jsonBody;
  Map<String, dynamic> decoder;

  String _active;
  String _activeMemberCount;
  String _estateName;
  Map<String, String> _estate;  ///TODO: Change this into two strings
  String _grandCompany;
  String _id;
  String _name;
  String _rank;
  String _server;
  String _slogan;
  String _tag;

  XIVFreeCompany(this._id);

  set setActive(String u) => _active = u;
  get getActive => _active;

  set setActiveMemberCount(int u) => _activeMemberCount = u.toString();
  get getActiveMemberCount => _activeMemberCount;

  set setEstateName(String u) => _estateName = u;
  get getEstateName => _estateName;

  set setEstate(Map<String, String> u) => _estate = u;
  get getEstate => _estate;

  set setGrandCompany(String u) => _grandCompany = u;
  get getGrandCompany => _grandCompany;

  set setName(String u) => _name = u;
  get getName => _name;

  set setRank(int u) => _rank = u.toString();
  get getRank => _rank;

  set setServer(String u) => _server = u;
  get getServer => _server;

  set setSlogan(String u) => _slogan = u;
  get getSlogan => _slogan;

  set setTag(String u) => _tag = u;
  get getTag => _tag;

  Future fillVarsFC() async {
    dynamic response = await json.fetchAllDataFreeCompany(this._id);
    if (response.statusCode == 200) {
      jsonBody = response.body;
      decoder = jsonDecode(jsonBody);

      setActive = decoder['FreeCompany']['Active'];
      setActiveMemberCount = decoder['FreeCompany']['ActiveMemberCount'];
      setEstateName = decoder['FreeCompany']['Estate']['Name'];

//      setEstate = {
//        decoder['FreeCompany']['Estate']['Plot'],
//        decoder['FreeCompany']['Estate']['Greeting']
//      } as Map<String, String>;

      setGrandCompany = decoder['FreeCompany']['GrandCompany'];
      setName = decoder['FreeCompany']['Name'];
      setRank = decoder['FreeCompany']['Rank'];
      setServer = decoder['FreeCompany']['Server'];
      setSlogan = decoder['FreeCompany']['Slogan'];
      setTag = decoder['FreeCompany']['Tag'];
      notifyListeners();
    } else {
      print('Error parsing FC data.');
    }
  }
}
