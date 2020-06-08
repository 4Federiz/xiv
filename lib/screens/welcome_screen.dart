import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:responsive_widgets/responsive_widgets.dart';
import 'package:xiv/brains/url_handling.dart';
import 'package:xiv/consts/constants.dart';
import 'package:xiv/widgets/dropdown_menu.dart';
import 'package:xiv/widgets/flat_button.dart';

class WelcomeScreen extends StatefulWidget {
  UrlHandling json = UrlHandling();
  String jsonBody;
  Map<String, dynamic> decoder;

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    ResponsiveWidgets.init(
      context,
      height: 1920, // Optional
      width: 1080, // Optional
      allowFontScaling: true, // Optional
    );

    return ResponsiveWidgets.builder(
        child: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            ContainerResponsive(
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
                ContainerResponsive(
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.only(left: 10),
                  child: FButton(
                    text: '  Search',
                    toDo: () async {
                      dynamic response = await widget.json.fetchData();

                      if (response.statusCode == 200) {
                        widget.jsonBody = response.body;
                        widget.decoder = jsonDecode(widget.jsonBody);
                        print(widget.decoder['Results'][0]['ID']);
//                        Navigator.pushNamed(context, kRouteCharacterScreen);
                      } else {
                        print('Error parsing data. URL may be wrong');
                      }
                    },
                  ),
                ),
                VerticalDivider(),
                ContainerResponsive(
                  margin: EdgeInsets.all(10),
                  child: DropDownMenu(),
                ),
              ],
            ),
            Center(
              child: ContainerResponsive(
                width: double.maxFinite,
                height: 1080,
                heightResponsive: true,
                margin: EdgeInsets.only(top: 10, left: 20, right:  20, bottom: 5),
                color: Colors.grey,
                child: Icon(FFFonts.SymbolQuestion),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
