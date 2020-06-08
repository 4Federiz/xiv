import 'package:http/http.dart' as http;
import 'package:xiv/consts/constants.dart';

class UrlHandling {

  Future fetchData(String userName, String userServer) async {
    return await http.get('https://xivapi.com/character/search?name=' + userName + '&server=' + userServer);
  }

  Future fetchAllData(String userID) async {
    return await http.get('https://xivapi.com/character/' + userID);
  }

}
