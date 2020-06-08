import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xiv/brains/xiv.dart';
import 'package:xiv/consts/constants.dart';

class DropDownMenu extends StatefulWidget {
  @override
  _DropDownMenuState createState() => _DropDownMenuState();
}

class _DropDownMenuState extends State<DropDownMenu> {
  String dropdownValue;

  @override
  Widget build(BuildContext context) {
    final xivModel = Provider.of<XIV>(context);

    return DropdownButton<String>(
      hint: Text('Choose your Server'),
      value: dropdownValue,
      onChanged: (newValue) {
        setState(() {
          dropdownValue = newValue;
          xivModel.setServer = newValue;
        });
      },
      items: kServers.map<DropdownMenuItem<String>>((String val) {
        return DropdownMenuItem<String>(
          value: val,
          child: Text(val),
        );
      }).toList(),
    );
  }
}
