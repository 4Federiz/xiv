import 'package:flutter/material.dart';
import 'package:xiv/consts/constants.dart';

class FButton extends StatelessWidget {
  String text;
  Function toDo;

  FButton({this.text, this.toDo});
  FButton.icon({this.text, this.toDo});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Row(
        children: <Widget>[
          Icon(FFFonts.app_character_info),
          Text(text),
        ],
      ),
      onPressed: toDo,
      color: kActiveColour,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
