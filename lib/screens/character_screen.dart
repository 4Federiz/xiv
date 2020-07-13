import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_widgets/responsive_widgets.dart';
import 'package:xiv/brains/xiv.dart';
import 'package:xiv/consts/constants.dart';
import 'package:xiv/widgets/clay_container.dart';

class CharacterScreen extends StatefulWidget {
  @override
  _CharacterScreenState createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {

  @override
  Widget build(BuildContext context) {
    final xivModel = Provider.of<XIV>(context);
    String job = xivModel.getItemJob;
    job = job.substring(job.length - 3);

    ResponsiveWidgets.init(
      context,
      height: 1920, // Optional
      width: 1080, // Optional
      allowFontScaling: true, // Optional
    );

    Widget freeCompanyCContainer() {
      if(xivModel.getFreeCompanyName == 'Not enlisted in a FC'){
        return CContainer(
            body: 'FreeCompany',
            sub: '${xivModel.getFreeCompanyName}',
            icon: FFFonts.app_group,
        );
      } else {
        return CContainer.colour(
            body: 'FreeCompany',
            sub: '${xivModel.getFreeCompanyName}',
            icon: FFFonts.app_group,
            color: kActiveColourAccent,
            activeOnPress: true,
            routeName: kRouteFreeCompanyScreen,
        );
      }
    }

    return ResponsiveWidgets.builder(
      //Override back button, it presses 3 times.
      child: WillPopScope(
        onWillPop: () async {
          int count = 0;
          Navigator.of(context).popUntil((_) => count++ >= 2);
          return true;
        },
        child: Scaffold(
          body: SafeArea(
            child: Center(
              child: CustomScrollView(
                slivers: <Widget>[
                  SliverAppBar(
//                  title: Container(
//                    margin: EdgeInsets.only(top: 30),
//                    child: Text('${xivModel.getName}'),
//                  ),
                    expandedHeight: 100,
                    floating: false,
                    backgroundColor: Colors.transparent,
                    flexibleSpace: FlexibleSpaceBar(
                      background: ContainerResponsive(
                        padding: EdgeInsets.only(bottom: 5),
                        alignment: Alignment.center,
                        child: Stack(
                          children: <Widget>[
                            ClipOval(
                              child: Image.network(
                                '${xivModel.getAvatar}',
                                fit: BoxFit.fill,
                              ),
                            ),
                            Positioned(
                              child: Icon(kJob[job].icon, size: 30,) ?? Icon(kJob['NoJob'].icon, size: 30,),
                              right: 0,
                              top: 70,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        CContainer(body: '${xivModel.getName}',sub: 'Player ID: ${xivModel.getID}', icon: FFFonts.app_character_info),
                        CContainer(body: 'Biography',sub: '${xivModel.getBio}', icon: FFFonts.app_notification_notices),
                        freeCompanyCContainer(),
                      CContainer.colour(body: 'Gear',sub: '', icon: FFFonts.ArmoryChest, color: kActiveColourAccent, activeOnPress: true, routeName: kRouteGearScreen),
                        Hero(
                          tag: kHeroTagPortrait,
                          child: ContainerResponsive(
                            heightResponsive: true,
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            child: Image.network(
                              '${xivModel.getPortrait}',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        CContainer(body: 'Birthday',sub: '${xivModel.getNameDay}', icon: FFFonts.Schedule),
                        CContainer(body: 'Guardian',sub: '${xivModel.getGuardianDeity}', icon: FFFonts.ItemCategory_Crystal),
                      ],
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