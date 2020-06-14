import 'package:http/http.dart' as http;

class UrlHandling {
  Future fetchData(String userName, String userServer) async {
    return await http.get('https://xivapi.com/character/search?name=' + userName + '&server=' + userServer);
  }

  Future fetchAllDataCharacter(String userID) async {
    return await http.get('https://xivapi.com/character/' + userID);
  }

  Future fetchAllDataFreeCompany(String freeCompanyID) async {
    return await http.get('https://xivapi.com/freecompany/' + freeCompanyID);
  }

  Future fetchAllDataItem(String itemID) async {
    return await http.get('https://xivapi.com/item/' + itemID);
  }
}