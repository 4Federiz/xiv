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
}
