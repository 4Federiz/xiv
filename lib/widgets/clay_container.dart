import 'package:flutter/material.dart';
import 'package:responsive_widgets/responsive_widgets.dart';
import 'package:xiv/consts/constants.dart';

class CContainer extends StatelessWidget {
  String body, sub;
  IconData icon;
  Color color;
  bool activeOnPress = false;
  String routeName;

  CContainer({this.icon, this.body, this.sub});
  CContainer.colour(
      {this.icon,
      this.body,
      this.sub,
      this.color,
      this.activeOnPress = true,
      this.routeName});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      child: ContainerResponsive(
        child: xivListTile(context),
        decoration: BoxDecoration(
          color: color ?? kActiveColour,
        ),
      ),
    );
  }

  xivListTile(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      leading: Container(
        padding: EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          border: Border(
            right: BorderSide(width: 1, color: Colors.white24),
          ),
        ),
        child: Icon(
          icon,
          color: kBackgroundColour,
          size: 40,
        ),
      ),
      title: Text('$body', style: kTextStyleBody),
      subtitle: Text('$sub', style: kTextStyleSub),
//      trailing: Icon(icon, color: kBackgroundColour, size: 30),
      onTap: () {
        if (!activeOnPress) {
          ///TODO: Implement Copy info to clipboard?
        } else if (activeOnPress) {
          print(activeOnPress);
//          Navigator.pushNamed(context, routeName);
        }
      },
    );
  }
}
