import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:xiv/brains/url_handling.dart';
import 'package:xiv/brains/xiv.dart';
import 'package:xiv/consts/constants.dart';
import 'package:xiv/widgets/dropdown_menu.dart';
import 'package:xiv/widgets/flat_button.dart';

class WelcomeScreen extends StatefulWidget {
  UrlHandling json = UrlHandling();
  XIV xiv;
  String jsonBody;
  Map<String, dynamic> decoder;

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  icon: Hero(
                    tag: kHeroTagIntroScreen,
                    child: Icon(
                      FFFonts.FFXIVMeteo,
                      size: 60,
                    ),
                  ),
                  labelText: 'Character Name',
                  hintText: '',
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.only(left: 10),
                  child: FButton(
                    text: '  Search',
                    toDo: () async {
                      //Search url from string Textfield and push new screen.
                      dynamic response = await widget.json.fetchData();

                      if (response.statusCode == 200) {
                        widget.jsonBody = response.body;
                        widget.decoder = jsonDecode(widget.jsonBody);
                        widget.xiv.userID = widget.decoder['Results'][0]['ID'];
                        Navigator.pushNamed(context, kRouteCharacterScreen);
                      } else {
                        print('Error parsing data. URL may be wrong');
                      }
                    },
                  ),
                ),
                VerticalDivider(),
                Container(
                  margin: EdgeInsets.all(10),
                  child: DropDownMenu(),
                ),
              ],
            ),

            ///TODO: News feed would go here
          ],
        ),
      ),
    );
  }
}
