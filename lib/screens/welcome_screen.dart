import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_widgets/responsive_widgets.dart';
import 'package:xiv/brains/xiv.dart';
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
  String textFieldValue;

  @override
  Widget build(BuildContext context) {
    Random random = Random();
    final xivModel = Provider.of<XIV>(context);

    ResponsiveWidgets.init(
      context,
      height: 1920, // Optional
      width: 1080, // Optional
      allowFontScaling: true, // Optional
    );

    void digApi() async {
      kLoadingIndicator(context);

      dynamic response = await widget.json
          .fetchData(textFieldValue.trim(), xivModel.getServer);

      if (response.statusCode == 200) {
        widget.jsonBody = response.body;
        widget.decoder = jsonDecode(widget.jsonBody);

        xivModel.setName = widget.decoder['Results'][0]['Name'];
        xivModel.setID = widget.decoder['Results'][0]['ID'];

        dynamic secondResponse =
            await widget.json.fetchAllDataCharacter(xivModel.getID);
        if (secondResponse.statusCode == 200) {
          widget.jsonBody = secondResponse.body;
          widget.decoder = jsonDecode(widget.jsonBody);

          xivModel.fillVarsCharacter(widget.decoder);

          if (xivModel.getFreeCompanyId != null) {
            dynamic thirdResponse = await widget.json
                .fetchAllDataFreeCompany(xivModel.getFreeCompanyId);
            if (thirdResponse.statusCode == 200) {
              widget.jsonBody = thirdResponse.body;
              widget.decoder = jsonDecode(widget.jsonBody);
              xivModel.fillVarsFC(widget.decoder);
            }
          } else {
            xivModel.setFreeCompanyName = 'Not enlisted in a FC';
          }

          Navigator.pushNamedAndRemoveUntil(
            context,
            kRouteCharacterScreen,
            (_) => false,
          );
        } else {
          print('Error parsing data. Server may be wrong');
          Navigator.pop(context);
        }
      } else {
        print('Error parsing data. Name may be wrong');
        Navigator.pop(context);
      }
    }

    return ResponsiveWidgets.builder(
      child: Scaffold(
        body: SafeArea(
          child: GestureDetector(
            onTap: () {
              FocusScopeNode currentFocus = FocusScope.of(context);
              if (!currentFocus.hasPrimaryFocus) {
                currentFocus.unfocus();
              }
            },
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  ContainerResponsive(
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    padding: EdgeInsets.only(top: 30),
                    child: TextField(
                      onChanged: (v) {
                        textFieldValue = v;
                      },
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
                          toDo: digApi,
                        ),
                      ),
                      VerticalDivider(),
                      ContainerResponsive(
                        margin: EdgeInsets.all(10),
                        child: DropDownMenu(),
                      ),
                    ],
                  ),
                  Flexible(
                    child: Center(
                      child: ContainerResponsive(
                        width: double.maxFinite,
                        height: 1080,
                        heightResponsive: true,
                        margin: EdgeInsets.only(left: 20, right: 20, bottom: 5),
                        color: Colors.transparent,
                        child: Image.asset('assets/stickers/chat_stamp_${random.nextInt(39) + 1}.png'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
