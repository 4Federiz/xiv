import 'package:flutter/material.dart';
import 'package:giffy_dialog/giffy_dialog.dart';

class CDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NetworkGiffyDialog(
        onlyOkButton: true,
        onOkButtonPressed: () {Navigator.pop(context);Navigator.pop(context);},
        entryAnimation: EntryAnimation.BOTTOM,
        image: Image.network(
            'https://media.tenor.com/images/1361bfbbf3456b78cefadb1838a0a9b3/tenor.gif'),
        title: Text(
          'This is work in Beta',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w600),
        ),
        description: Text(
          'More functionality (like being able to see the avatar Gear or search for items) will be implemented soon.',
          textAlign: TextAlign.left,
        ),
    );
  }
}
