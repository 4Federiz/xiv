import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xiv/brains/xiv.dart';

class CharacterScreen extends StatefulWidget {
  @override
  _CharacterScreenState createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  @override
  Widget build(BuildContext context) {
    final xivModel = Provider.of<XIV>(context);

    return Scaffold(
      body: Center(
        child: Center(
          child: Image.network(xivModel.getPortrait),
        ),
      ),
    );
  }
}
