import 'package:flutter/material.dart';
import 'package:xiv/brains/xiv.dart';

class CharacterScreen extends StatefulWidget {
  XIV xiv;

  @override
  _CharacterScreenState createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('${widget.xiv.userID}'),
      ),
    );
  }
}
