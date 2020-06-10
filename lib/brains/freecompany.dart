import 'dart:convert';

import 'package:xiv/brains/url_handling.dart';

class XIVFreeCompany {
  /// https://xivapi.com/freecompany/9233645873504816758

  UrlHandling json = UrlHandling();
  String jsonBody;
  Map<String, dynamic> decoder;

  String _active;
  String _activeMemeberCount;
  String _estateName;
  Map<String, String> _estate;
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

  void fillVarsFC() async {
    dynamic response = await json.fetchAllDataFreeCompany(this._id);
    if (response.statusCode == 200) {
      jsonBody = response.body;
      decoder = jsonDecode(jsonBody);

      ///TODO populate all data from set->json

    } else {
      print('Error parsing FC data.');
    }
  }
}
