import 'dart:async';
import 'package:flutter/material.dart';
import 'package:xiv/consts/constants.dart';

class IntroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Timer _timer = Timer(Duration(seconds: 3), () {
      Navigator.pushNamed(context, kRouteWelcomeScreen);
    });

    return Scaffold(
      body: Hero(
        tag: kHeroTagIntroScreen,
        child: Center(
          child: Icon(
            FFFonts.FFXIVMeteo,
            size: 60,
          ),
        ),
      ),
    );
  }
}
