import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_widgets/responsive_widgets.dart';
import 'package:xiv/brains/xiv.dart';
import 'package:xiv/consts/constants.dart';

class GearScreen extends StatefulWidget {
  @override
  _GearScreenState createState() => _GearScreenState();
}

///TODO: Handle materia with strings. they come as ints.
class _GearScreenState extends State<GearScreen> {
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
          body: SafeArea(
            child: Center(
              child: Text(
                job,
                style: kTextStyleBody,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
