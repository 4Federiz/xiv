import 'package:flutter/material.dart';
import 'package:xiv/consts/constants.dart';
import 'package:xiv/screens/character_screen.dart';
import 'package:xiv/screens/intro_screen.dart';
import 'package:xiv/screens/welcome_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: kTheme,
      initialRoute: kRouteIntroScreen,
      routes: {
        kRouteIntroScreen: (context) => IntroScreen(),
        kRouteWelcomeScreen: (context) => WelcomeScreen(),
        kRouteCharacterScreen: (context) => CharacterScreen(),
      },
    );
  }
}
