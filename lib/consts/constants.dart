//https://xivapi.com/docs
//My character url: https://xivapi.com/character/search?name=Fed+Eriz&server=Adamantoise
import 'package:flutter/material.dart';
export 'f_f_fonts_icons.dart';

final String kApiKey = '?private_key=dd7264709cc043678c0f79dec7a6325ec4089f637eec45278e083d957d11981c';
final String kUrl = 'https://xivapi.com/';
final String kCharacter = 'character/';

final kActiveColour = Color(0xFFFCA908);
final kBackgroundColour = Color(0xFFEFEEEA);

final kTheme = ThemeData.dark().copyWith(
//  scaffoldBackgroundColor: kBackgroundColour,
);

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