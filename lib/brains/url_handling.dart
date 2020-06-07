import 'xiv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:xiv/consts/constants.dart';

class UrlHandling {
  String urlTest =
      kUrl + kCharacter + 'search?name=Fed+Eriz&server=Adamantoise';
//  String urlTestId = kUrl + kCharacter + idUser;

  Future fetchData() async {
    return await http.get('https://xivapi.com/character/search?name=Fed+Eriz&server=Adamantoise');
  }

//  void parseCharacterData() {
//    print('Enter parseCharacterData');
//    XIV xiv = XIV(
//      avatar: decoder['Results'][0]['Avatar'],
//      feastMatches: decoder['Results'][0]['FeastMatches'],
//      id: decoder['Results'][0]['ID'],
//      language: decoder['Results'][0]['Lang'],
//      characterName: decoder['Results'][0]['Name'],
//      rank: decoder['Results'][0]['Rank'],
//      server: decoder['Results'][0]['Server'],
//    );
//  }
}
