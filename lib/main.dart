import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xiv/brains/xiv.dart';
import 'package:xiv/consts/constants.dart';
import 'package:xiv/screens/character_screen.dart';
import 'package:xiv/screens/freecompany_screen.dart';
import 'package:xiv/screens/gear_screen.dart';
import 'package:xiv/screens/intro_screen.dart';
import 'package:xiv/screens/welcome_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ThemeData.light(),
      dark: ThemeData.dark(),
      initial: AdaptiveThemeMode.dark, //AdaptiveThemeMode.system,
      builder: (theme, darkTheme) => ChangeNotifierProvider<XIV>(
        create: (_) => XIV(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: theme,
          darkTheme: darkTheme,
          initialRoute: kRouteIntroScreen,
          routes: {
            kRouteIntroScreen: (context) => IntroScreen(),
            kRouteWelcomeScreen: (context) => WelcomeScreen(),
            kRouteCharacterScreen: (context) => CharacterScreen(),
            kRouteFreeCompanyScreen: (context) => FreeCompanyScreen(),
            kRouteGearScreen: (context) => GearScreen(),
          },
        ),
      ),
    );
  }
}
