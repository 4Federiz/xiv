import 'package:flutter/material.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:xiv/consts/f_f_fonts_icons.dart';
export 'f_f_fonts_icons.dart';

final String kApiKey =
    '?private_key=dd7264709cc043678c0f79dec7a6325ec4089f637eec45278e083d957d11981c';
final String kUrl = 'https://xivapi.com/';
final String kUrlDocs = 'https://xivapi.com/docs';

const kActiveColour = Color.fromRGBO(64, 75, 96, 0.9);
const kActiveColourDim = Color(0xFFEFEEEA);
const kActiveColourAccent = Color.fromRGBO(65, 88, 128, 0.9);
const kBackgroundColour = Colors.white24;

const kHeroTagIntroScreen = 'IntroScreenTag';

const kRouteCharacterScreen = '/Character';
const kRouteWelcomeScreen = '/Welcome';
const kRouteIntroScreen = '/';

const kTextStyleBody = TextStyle(
  color: kActiveColourDim,
  fontWeight: FontWeight.bold,
);

const kTextStyleSub = TextStyle(
  color: kActiveColourDim,
  fontWeight: FontWeight.w200,
);

final kTheme = ThemeData.dark();

void kLoadingIndicator(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Dialog(
        child: GlowingProgressIndicator(
          child: Icon(
            FFFonts.app_payment_symbol,
            size: 100,
          ), //FadingText('Loading...'),
        ),
      );
    },
  );
}

Map<String, String> kDeities = {
  '1': 'Halone, The Fury',
  '2': 'Menphina, The Lover',
  '3': 'Thaliak, The Scholar',
  '4': 'Nymeia, The Spinner',
  '5': 'Llymlaen, The Navigator',
  '6': 'Oschon, The Wanderer',
  '7': 'Byregot, The Builder',
  '8': 'Rhalgr, The Destroyer',
  '9': 'Azeyma, The Warden',
  '10': 'Nald\'thal, The Traders',
  '11': 'Nophica, The Matron',
  '12': 'Althyk, The Keeper',
};

List<String> kServers = [
  'Adamantoise',
  'Aegis',
  'Alexander',
  'Anima',
  'Asura',
  'Atomos',
  'Bahamut',
  'Balmung',
  'Behemoth',
  'Belias',
  'Brynhildr',
  'Cactuar',
  'Carbuncle',
  'Cerberus',
  'Chocobo',
  'Coeurl',
  'Diabolos',
  'Durandal',
  'Excalibur',
  'Exodus',
  'Faerie',
  'Famfrit',
  'Fenrir',
  'Garuda',
  'Gilgamesh',
  'Goblin',
  'Gungnir',
  'Hades',
  'Hyperion',
  'Ifrit',
  'Ixion',
  'Jenova',
  'Kujata',
  'Lamia',
  'Leviathan',
  'Lich',
  'Louisoix',
  'Malboro',
  'Mandragora',
  'Masamune',
  'Mateus',
  'Midgardsormr',
  'Moogle',
  'Odin',
  'Omega',
  'Pandaemonium',
  'Phoenix',
  'Ragnarok',
  'Ramuh',
  'Ridill',
  'Sargatanas',
  'Shinryu',
  'Shiva',
  'Siren',
  'Tiamat',
  'Titan',
  'Tonberry',
  'Typhon',
  'Ultima',
  'Ultros',
  'Unicorn',
  'Valefor',
  'Yojimbo',
  'Zalera',
  'Zeromus',
  'Zodiark',
  'Spriggan',
  'Twintania'
];
