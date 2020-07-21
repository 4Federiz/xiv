import 'package:xiv/controllers/main_interface.dart';

void main() {
  runApp(MyApp());
}

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
            kRouteErrorScreen: (context) => ErrorScreen(),
          },
        ),
      ),
    );
  }
}
