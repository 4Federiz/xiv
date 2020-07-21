import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_widgets/responsive_widgets.dart';
import 'package:xiv/brains/xiv.dart';
import 'package:xiv/consts/constants.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'package:xiv/widgets/clay_container.dart';
import 'package:xiv/widgets/clay_flipcard.dart';

class GearScreen extends StatefulWidget {
  @override
  _GearScreenState createState() => _GearScreenState();
}

///TODO: Handle materia with strings. they come as ints.
class _GearScreenState extends State<GearScreen> {
  @override
  Widget build(BuildContext context) {
    final xivModel = Provider.of<XIV>(context);

    ResponsiveWidgets.init(
      context,
      height: 1920, // Optional
      width: 1080, // Optional
      allowFontScaling: true, // Optional
    );

    return Hero(
      tag: kHeroTagPortrait,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(xivModel.getPortrait),
            fit: BoxFit.fitHeight,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Row(
            children: <Widget>[
              SafeArea(
                child: ShowUpList(
                  direction: Direction.vertical,
                  animationDuration: Duration(milliseconds: 1500),
                  delayBetween: Duration(milliseconds: 800),
                  offset: -0.1,
                  children: <Widget>[
                    ClayFlipCard(
                      itemImage: xivModel.getItemIconMainHand,
                      child: CContainer.info(
                        body: '${xivModel.getItemName}',
                        sub:
                            '-ID: ${xivModel.getGearMainHandID}\n -iLvl: ${xivModel.getItemiLevel}\n-Materia: ${xivModel.getGearMainHandMateriaCount} melds',
                        icon: FFFonts.Armoury_MainArm,
                      ),
                    ),
//                    Image.network(xivHead.getItemIcon,),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
