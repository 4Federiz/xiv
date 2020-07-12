import 'package:flutter/material.dart';
import 'package:giffy_dialog/giffy_dialog.dart';

class CDialog extends StatelessWidget {
  String title, body, gifString;
  RichText richText;
  CDialog({this.title, this.body, this.gifString});

  @override
  Widget build(BuildContext context) {
    return NetworkGiffyDialog(
        onlyOkButton: true,
        onOkButtonPressed: () {Navigator.pop(context);Navigator.pop(context);},
        entryAnimation: EntryAnimation.BOTTOM,
        image: Image.network(gifString),
        title: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w600),
        ),
        description: Text(
          body,
          textAlign: TextAlign.left,
        ),
    );
  }
}
