import 'package:flutter/material.dart';
import 'package:xiv/brains/json_handling.dart';
import 'package:xiv/brains/xiv.dart';
import 'package:xiv/consts/constants.dart';
import 'package:xiv/widgets/flat_button.dart';

class WelcomeScreen extends StatefulWidget {
  JsonHandling json = JsonHandling();
  XIV xiv;

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();

    //This will automatically fetch Fed Eriz' data.
//    widget.json.fetchData(widget.xiv);
  }

  @override
  Widget build(BuildContext context) {
    String dropdownValue;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(10),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Character Name',
                  hintText: '',
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.only(left: 10),
                  child: FButton(
                    text: 'Search',
                    toDo: () async {
                      //Search and new screen.
                      await widget.json.fetchData(widget.xiv);
//                      widget.xiv.test();
                    },
                  ),
                ),
                VerticalDivider(),
                Container(
                  margin: EdgeInsets.all(10),
                  child: DropdownButton<String>(
                    hint: Text('Choose your Server'),
                    value: dropdownValue,
                    onChanged: (newValue) {
                      setState(() {
                        dropdownValue = newValue;
                        print(dropdownValue);
                      });
                    },
                    items: kServers.map<DropdownMenuItem<String>>((String val) {
                      return DropdownMenuItem<String>(
                        value: val,
                        child: Text(val),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
