import 'package:xiv/controllers/intro_interface.dart';

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
