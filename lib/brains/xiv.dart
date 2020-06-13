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
  String _guardianDeity;
  String _id;
  String _name;
  String _nameDay;
  String _portrait;
  String _server;

  XIVFreeCompany _freeCompany = XIVFreeCompany();

  XIVGear _gearBody = XIVGear();
  XIVGear _gearBracelets = XIVGear();
  XIVGear _gearEarrings = XIVGear();
  XIVGear _gearFeet = XIVGear();
  XIVGear _gearHands = XIVGear();
  XIVGear _gearHead = XIVGear();
  XIVGear _gearLegs = XIVGear();
  XIVGear _gearMainHand = XIVGear();
  XIVGear _gearNecklace = XIVGear();
  XIVGear _gearRing1 = XIVGear();
  XIVGear _gearRing2 = XIVGear();
  XIVGear _gearWaist = XIVGear();

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

  get getGearBodyCreator => _gearBody.getCreator;
  get getGearBodyDye => _gearBody.getDye;
  get getGearBodyID => _gearBody.getID;
  get getGearBodyMateria => _gearBody.getMateria;

  get getGearBraceletsCreator => _gearBracelets.getCreator;
  get getGearBraceletsDye => _gearBracelets.getDye;
  get getGearBraceletsID => _gearBracelets.getID;
  get getGearBraceletsMateria => _gearBracelets.getMateria;

  get getGearEarringsCreator => _gearEarrings.getCreator;
  get getGearEarringsDye => _gearEarrings.getDye;
  get getGearEarringsID => _gearEarrings.getID;
  get getGearEarringsMateria => _gearEarrings.getMateria;

  get getGearFeetCreator => _gearFeet.getCreator;
  get getGearFeetDye => _gearFeet.getDye;
  get getGearFeetID => _gearFeet.getID;
  get getGearFeetMateria => _gearFeet.getMateria;

  get getGearHandsCreator => _gearHands.getCreator;
  get getGearHandsDye => _gearHands.getDye;
  get getGearHandsID => _gearHands.getID;
  get getGearHandsMateria => _gearHands.getMateria;

  get getGearHeadCreator => _gearHead.getCreator;
  get getGearHeadDye => _gearHead.getDye;
  get getGearHeadID => _gearHead.getID;
  get getGearHeadMateria => _gearHead.getMateria;

  get getGearLegsCreator => _gearLegs.getCreator;
  get getGearLegsDye => _gearLegs.getDye;
  get getGearLegsID => _gearLegs.getID;
  get getGearLegsMateria => _gearLegs.getMateria;

  get getGearMainHandCreator => _gearMainHand.getCreator;
  get getGearMainHandDye => _gearMainHand.getDye;
  get getGearMainHandID => _gearMainHand.getID;
  get getGearMainHandMateria => _gearMainHand.getMateria;

  get getGearNecklaceCreator => _gearNecklace.getCreator;
  get getGearNecklaceDye => _gearNecklace.getDye;
  get getGearNecklaceID => _gearNecklace.getID;
  get getGearNecklaceMateria => _gearNecklace.getMateria;

  get getGearRing1Creator => _gearRing1.getCreator;
  get getGearRing1Dye => _gearRing1.getDye;
  get getGearRing1ID => _gearRing1.getID;
  get getGearRing1Materia => _gearRing1.getMateria;

  get getGearRing2Creator => _gearRing2.getCreator;
  get getGearRing2Dye => _gearRing2.getDye;
  get getGearRing2ID => _gearRing2.getID;
  get getGearRing2Materia => _gearRing2.getMateria;

  get getGearWaistCreator => _gearWaist.getCreator;
  get getGearWaistDye => _gearWaist.getDye;
  get getGearWaistID => _gearWaist.getID;
  get getGearWaistMateria => _gearWaist.getMateria;

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
    this._guardianDeity = map['Character']['GuardianDeity'].toString();
    this._nameDay = map['Character']['Nameday'];
    this._portrait = map['Character']['Portrait'];
    this._server = map['Character']['Server'];
    fillVarsGear(map);
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

  void fillVarsGear(Map<String, dynamic> decoder) {
    /// https://xivapi.com/item/29427
    _gearBody.setCreator = decoder['Character']['GearSet']['Gear']['Body']['Creator'];
    _gearBody.setDye = decoder['Character']['GearSet']['Gear']['Body']['Dye'];
    _gearBody.setID = decoder['Character']['GearSet']['Gear']['Body']['ID'];
    _gearBody.setMateria = decoder['Character']['GearSet']['Gear']['Body']['Materia'];

    _gearBracelets.setCreator = decoder['Character']['GearSet']['Gear']['Bracelets']['Creator'];
    _gearBracelets.setDye = decoder['Character']['GearSet']['Gear']['Bracelets']['Dye'];
    _gearBracelets.setID = decoder['Character']['GearSet']['Gear']['Bracelets']['ID'];
    _gearBracelets.setMateria = decoder['Character']['GearSet']['Gear']['Bracelets']['Materia'];

    _gearEarrings.setCreator = decoder['Character']['GearSet']['Gear']['Earrings']['Creator'];
    _gearEarrings.setDye = decoder['Character']['GearSet']['Gear']['Earrings']['Dye'];
    _gearEarrings.setID = decoder['Character']['GearSet']['Gear']['Earrings']['ID'];
    _gearEarrings.setMateria = decoder['Character']['GearSet']['Gear']['Earrings']['Materia'];

    _gearFeet.setCreator = decoder['Character']['GearSet']['Gear']['Feet']['Creator'];
    _gearFeet.setDye = decoder['Character']['GearSet']['Gear']['Feet']['Dye'];
    _gearFeet.setID = decoder['Character']['GearSet']['Gear']['Feet']['ID'];
    _gearFeet.setMateria = decoder['Character']['GearSet']['Gear']['Feet']['Materia'];

    _gearHands.setCreator = decoder['Character']['GearSet']['Gear']['Hands']['Creator'];
    _gearHands.setDye = decoder['Character']['GearSet']['Gear']['Hands']['Dye'];
    _gearHands.setID = decoder['Character']['GearSet']['Gear']['Hands']['ID'];
    _gearHands.setMateria = decoder['Character']['GearSet']['Gear']['Hands']['Materia'];

    _gearHead.setCreator = decoder['Character']['GearSet']['Gear']['Head']['Creator'];
    _gearHead.setDye = decoder['Character']['GearSet']['Gear']['Head']['Dye'];
    _gearHead.setID = decoder['Character']['GearSet']['Gear']['Head']['ID'];
    _gearHead.setMateria = decoder['Character']['GearSet']['Gear']['Head']['Materia'];

    _gearLegs.setCreator = decoder['Character']['GearSet']['Gear']['Legs']['Creator'];
    _gearLegs.setDye = decoder['Character']['GearSet']['Gear']['Legs']['Dye'];
    _gearLegs.setID = decoder['Character']['GearSet']['Gear']['Legs']['ID'];
    _gearLegs.setMateria = decoder['Character']['GearSet']['Gear']['Legs']['Materia'];

    _gearMainHand.setCreator = decoder['Character']['GearSet']['Gear']['MainHand']['Creator'];
    _gearMainHand.setDye = decoder['Character']['GearSet']['Gear']['MainHand']['Dye'];
    _gearMainHand.setID = decoder['Character']['GearSet']['Gear']['MainHand']['ID'];
    _gearMainHand.setMateria = decoder['Character']['GearSet']['Gear']['MainHand']['Materia'];

    _gearNecklace.setCreator = decoder['Character']['GearSet']['Gear']['Necklace']['Creator'];
    _gearNecklace.setDye = decoder['Character']['GearSet']['Gear']['Necklace']['Dye'];
    _gearNecklace.setID = decoder['Character']['GearSet']['Gear']['Necklace']['ID'];
    _gearNecklace.setMateria = decoder['Character']['GearSet']['Gear']['Necklace']['Materia'];

    _gearRing1.setCreator = decoder['Character']['GearSet']['Gear']['Ring1']['Creator'];
    _gearRing1.setDye = decoder['Character']['GearSet']['Gear']['Ring1']['Dye'];
    _gearRing1.setID = decoder['Character']['GearSet']['Gear']['Ring1']['ID'];
    _gearRing1.setMateria = decoder['Character']['GearSet']['Gear']['Ring1']['Materia'];

    _gearRing2.setCreator = decoder['Character']['GearSet']['Gear']['Ring2']['Creator'];
    _gearRing2.setDye = decoder['Character']['GearSet']['Gear']['Ring2']['Dye'];
    _gearRing2.setID = decoder['Character']['GearSet']['Gear']['Ring2']['ID'];
    _gearRing2.setMateria = decoder['Character']['GearSet']['Gear']['Ring2']['Materia'];

    _gearWaist.setCreator = decoder['Character']['GearSet']['Gear']['Waist']['Creator'];
    _gearWaist.setDye = decoder['Character']['GearSet']['Gear']['Waist']['Dye'];
    _gearWaist.setID = decoder['Character']['GearSet']['Gear']['Waist']['ID'];
    _gearWaist.setMateria = decoder['Character']['GearSet']['Gear']['Waist']['Materia'];
    notifyListeners();
  }
}