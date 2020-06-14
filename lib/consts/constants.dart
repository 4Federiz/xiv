import 'package:flutter/material.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:xiv/consts/f_f_fonts_icons.dart';
export 'f_f_fonts_icons.dart';

final String kApiKey =
    '?private_key=dd7264709cc043678c0f79dec7a6325ec4089f637eec45278e083d957d11981c';
final String kUrl = 'https://xivapi.com/';
final String kUrlNoDash = 'https://xivapi.com';
final String kUrlDocs = 'https://xivapi.com/docs';

const kActiveColour = Color.fromRGBO(64, 75, 96, 0.9);
const kActiveColourDim = Color(0xFFEFEEEA);
const kActiveColourAccent = Color.fromRGBO(65, 88, 128, 0.9);
const kBackgroundColour = Colors.white24;

const kHeroTagIntroScreen = 'IntroScreenTag';
const kHeroTagPortrait = 'PortraitTag';

const kRouteGearScreen = '/Gear';
const kRouteFreeCompanyScreen = '/FC';
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

const kTextStyleInfo = TextStyle(
  color: kActiveColourDim,
  fontWeight: FontWeight.w700,
  fontSize: 25,
);

final kTheme = ThemeData.dark();

void kLoadingIndicator(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Colors.transparent,
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

Map<String, Icon> kJob = {
  'NoJob': Icon(FFFonts.SymbolMamet),
  'WAR': Icon(FFFonts.class_job_021),
  'ACN': Icon(FFFonts.class_job_026),
  'ADV': Icon(FFFonts.ItemCategory_Shield),
  'ALC': Icon(FFFonts.class_job_014),
  'ARC': Icon(FFFonts.class_job_005),
  'ARM': Icon(FFFonts.class_job_010),
  'AST': Icon(FFFonts.class_job_033),
  'BLM': Icon(FFFonts.class_job_025),
  'BLU': Icon(FFFonts.class_job_036),
  'BRD': Icon(FFFonts.class_job_023),
  'BSM': Icon(FFFonts.ItemCategory_BSM),
  'BTN': Icon(FFFonts.ItemCategory_BTN),
  'CNJ': Icon(FFFonts.ItemCategory_CNJ),
  'CRP': Icon(FFFonts.ItemCategory_CRP),
  'CUL': Icon(FFFonts.ItemCategory_CUL),
  'DNC': Icon(FFFonts.class_job_038),
  'DRG': Icon(FFFonts.class_job_022),
  'DRK': Icon(FFFonts.class_job_032),
  'FSH': Icon(FFFonts.ItemCategory_fisher),
  'GLA': Icon(FFFonts.ItemCategory_GLA),
  'GNB': Icon(FFFonts.class_job_037),
  'GSM': Icon(FFFonts.ItemCategory_GSM),
  'LNC': Icon(FFFonts.ItemCategory_LNC),
  'LTW': Icon(FFFonts.ItemCategory_LTW),
  'MCH': Icon(FFFonts.class_job_031),
  'MIN': Icon(FFFonts.ItemCategory_MIN),
  'MNK': Icon(FFFonts.class_job_020),
  'MRD': Icon(FFFonts.ItemCategory_MRD),
  'NIN': Icon(FFFonts.class_job_030),
  'PGL': Icon(FFFonts.ItemCategory_PGL),
  'PLD': Icon(FFFonts.class_job_019),
  'RDM': Icon(FFFonts.class_job_035),
  'ROG': Icon(FFFonts.ItemCategory_ROG),
  'SAM': Icon(FFFonts.class_job_034),
  'SCH': Icon(FFFonts.class_job_028),
  'SMN': Icon(FFFonts.class_job_027),
  'THM': Icon(FFFonts.ItemCategory_THM),
  'WHM': Icon(FFFonts.class_job_024),
  'WVR': Icon(FFFonts.ItemCategory_WVR)
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
