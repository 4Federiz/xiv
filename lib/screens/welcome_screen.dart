import 'package:xiv/controllers/welcome_interface.dart';

import 'package:xiv/brains/ads.dart';
import 'package:firebase_admob/firebase_admob.dart';

class WelcomeScreen extends StatefulWidget {
  UrlHandling json = UrlHandling();
  String jsonBody;
  Map<String, dynamic> decoder;

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  String textFieldValue;

  _showDialog() async {
    await Future.delayed(Duration(milliseconds: 50));
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CDialog(
            title: 'Beta Version',
            body:
                'More functionality soon —like being able to see the avatar Gear or search for items.',
            gifString: kGifBeta,
          );
        });
  }

  _showCredits() {
    Dialog errorDialog = Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Container(
        height: 150.0,
        width: 100.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 1.0, bottom: 2.0),
              child: RichText(
                text: TextSpan(
                    text: 'This app was made thanks to:',
                    style: kTextStyleBody),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(0.5),
              child: RichText(
                text: TextSpan(children: [
                  WidgetSpan(
                      child: Icon(
                    FFFonts.SquareNo01,
                    size: 15,
                  )),
                  TextSpan(text: 'Square Enix', style: kTextStyleSub),
                  TextSpan(text: ', for the game I love.\n'),
                  WidgetSpan(
                      child: Icon(
                    FFFonts.SquareNo02,
                    size: 15,
                  )),
                  TextSpan(text: 'The XIVApi team.\n'),
                  WidgetSpan(
                      child: Icon(
                    FFFonts.SquareNo03,
                    size: 15,
                  )),
                  TextSpan(text: 'Collette Chrome\'siel for all the support.'),
                ]),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 0.0)),
            FlatButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: RichText(
                text: WidgetSpan(child: Icon(FFFonts.app_chat_stamp)),
              ),
            ),
          ],
        ),
      ),
    );
    showDialog(
        context: context, builder: (BuildContext context) => errorDialog);
  }

  @override
  void initState() {
    super.initState();
    _showDialog();
    FirebaseAdMob.instance.initialize(appId: FirebaseAdMob.testAppId);
    AdMobService.myBanner = AdMobService.buildBannerAd()..load();
  }

  @override
  void dispose() {
    AdMobService.myBanner.dispose();
    super.dispose();
  }

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

        if (widget.decoder['Pagination']['Page'] == 0) {
          print('Nothing found');
          Navigator.pushNamed(context, kRouteErrorScreen);
        }

        if (widget.decoder['Pagination']['Page'] == 1) {
          print('Found');
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

//          Navigator.pushNamedAndRemoveUntil(
            Navigator.pushNamed(
              context,
              kRouteCharacterScreen,
//            (_) => false,
            );
          }
        } else {
          print('Error parsing data. Server may be wrong');
        }
      }

      if (response.statusCode != 200) {
        print('Error parsing data. Name may be wrong');
      }
    }

    return ResponsiveWidgets.builder(
      child: WillPopScope(
        //Override back button. No way back.
        onWillPop: () async => false,
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
                          ///TODO: Handle empty input.
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
//                      fit: FlexFit.tight,
                      child: Center(
                        child: ContainerResponsive(
                          width: double.maxFinite,
                          height: 1080,
                          heightResponsive: true,
                          margin:
                              EdgeInsets.only(left: 20, right: 20, bottom: 5),
                          color: Colors.transparent,
                          child: Image.asset(
                              'assets/stickers/chat_stamp_${random.nextInt(39) + 1}.png'),
                        ),
                      ),
                    ),
//                    Row(
//                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                      crossAxisAlignment: CrossAxisAlignment.end,
//                      children: <Widget>[
//                        ButtonTheme(
//                          height: 1,
//                          minWidth: 5,
//                          child: RaisedButton(
//                            color: Colors.transparent,
//                            elevation: 0,
//                            child: Row(
//                              children: <Widget>[
//                                Icon(
//                                  FFFonts.SymbolMamet,
//                                  color: kBackgroundColour,
//                                ),
//                                Text(
//                                  '',
//                                  style: TextStyle(color: kBackgroundColour),
//                                ),
//                              ],
//                            ),
//                            onPressed: _showCredits,
//                            shape: RoundedRectangleBorder(
//                              borderRadius: BorderRadius.circular(10),
//                            ),
//                          ),
//                        ),
//                        Padding(
//                          padding: const EdgeInsets.only(right: 5, bottom: 15),
//                          child: RichText(
//                            text: TextSpan(
//                              children: [
//                                TextSpan(
//                                    text: 'Please report bugs ',
//                                    style: TextStyle(
//                                      color: Colors.white24,
//                                    )),
//                                TextSpan(
//                                  text: '@Federiz ',
//                                  style: TextStyle(
//                                    color: kActiveColourAccent,
//                                    decoration: TextDecoration.underline,
//                                  ),
//                                ),
//                                WidgetSpan(
//                                  child: Icon(
//                                    FFFonts.app_drawer_support,
//                                    color: Colors.white24,
//                                    size: 14,
//                                  ),
//                                )
//                              ],
//                            ),
//                          ),
//                        ),
//                      ],
//                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
