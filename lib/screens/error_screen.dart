import 'package:flutter/material.dart';
import 'package:xiv/consts/constants.dart';
import 'package:xiv/widgets/clay_dialog.dart';

class ErrorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CDialog(
      title: 'Citizen not found',
      body: 'Maybe lives in some other server?',
      gifString: kGifError,
    );
  }
}
