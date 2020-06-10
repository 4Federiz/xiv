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

    ResponsiveWidgets.init(
      context,
      height: 1920, // Optional
      width: 1080, // Optional
      allowFontScaling: true, // Optional
    );

    return ResponsiveWidgets.builder(
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
                      child: ClipOval(
                        child: Image.network(
                          '${xivModel.getAvatar}',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ),
                SliverList(
//                  itemExtent: 100,
                  delegate: SliverChildListDelegate(
                    [
                      CContainer(body: '${xivModel.getName}',sub: 'Player ID: ${xivModel.getID}', icon: FFFonts.app_character_info),
                      CContainer(body: 'Biography',sub: '${xivModel.getBio}', icon: FFFonts.app_notification_notices),
                      CContainer.colour(body: 'FreeCompany',sub: '${xivModel.getFreeCompanyName}', icon: FFFonts.app_group, color: kActiveColourAccent, activeOnPress: true), ///TODO: routeName => FC screen
                      CContainer(body: 'Guardian',sub: '${xivModel.getGuardianDeity}', icon: FFFonts.ItemCategory_Crystal),
                      ContainerResponsive(
                        heightResponsive: true,
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Image.network(
                          '${xivModel.getPortrait}',
                          fit: BoxFit.contain,
                        ),
                      ),
                      CContainer.colour(body: 'Gear',sub: 'soon', icon: FFFonts.ArmoryChest, color: kActiveColourAccent), ///TODO: routeName => Gear screen
                      CContainer(body: 'Birthday',sub: '${xivModel.getNameDay}', icon: FFFonts.Schedule),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}