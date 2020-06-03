import 'xiv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:xiv/consts/constants.dart';

class JsonHandling {
  bool status; //Checks the data was fetched correctly.
  String jsonBody;
  Map<String, dynamic> decoder;
  XIV xiv;

  Future fetchData(XIV xiv) async {
    print('Enter fetchData');
    this.xiv = xiv;
    String urlTest =
        kUrl + kCharacter + 'search?name=Fed+Eriz&server=Adamantoise';
    dynamic response = await http.get(urlTest);

    if (response.statusCode == 200) {
      print('Status true');
      status = true;
      jsonBody = response.body;
      decoder = jsonDecode(jsonBody);

      parseCharacterData();
    } else {
      print('Status false. Exit app.');
      status = false;
    }
  }

  void parseCharacterData() {
    print('Enter parseCharacterData');
    this.xiv = XIV(
      avatar: decoder['Results'][0]['Avatar'],
      feastMatches: decoder['Results'][0]['FeastMatches'],
      id: decoder['Results'][0]['ID'],
      language: decoder['Results'][0]['Lang'],
      characterName: decoder['Results'][0]['Name'],
      rank: decoder['Results'][0]['Rank'],
      server: decoder['Results'][0]['Server'],
    );
  }
}
