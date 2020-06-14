import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_widgets/responsive_widgets.dart';
import 'package:xiv/brains/xiv.dart';
import 'package:xiv/consts/constants.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'package:flip_card/flip_card.dart';
import 'package:xiv/widgets/clay_container.dart';

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
                    FlipCard(
                      ///TODO: Work on this.
                      front: ContainerResponsive(
                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        height: 280,
                        width: 280,
                        child: Image.network(
                          xivModel.getItemIcon,
                          fit: BoxFit.cover,
                        ),
                      ),
                      back: ContainerResponsive(
                        padding: EdgeInsets.only(left: 50),
                        height: 400,
                        width: 1000,
                        color: Colors.transparent,
                        child: CContainer.info(body: '${xivModel.getItemName}',sub: '-ID: ${xivModel.getItemID}\n -iLvl: LevelEquip\n -Materia: Materia/MateriaSlotCount melded', icon: FFFonts.Armoury_MainArm),
                      ),
                    ),
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
