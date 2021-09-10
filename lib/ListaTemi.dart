//SEMPLICEMENTE UNA LISTA DI TEMI

import 'package:flutter/material.dart';

// LEGENDA

// FOCUS COLOR = COLORE DEL SECONDO SFONDO PICCOLO CHE CONTIENE ARTICOLI
// PRIMARY COLOR = COLORE DELLO SFONDO PRINCIPALE E DEL DRAWER HEADER
// ACCENT COLOR = CORPO DRAWER E ICONA
//BODY TEXT2 TESTO DELLA DESCRIZIONE ARTICOLO
//HEADLINE 6 TITOLO ARTICOLO
//HEADLINE 4 DESCRIZIONE SWITCH
//HEADLINE 1 SCRITTA SCHERMATA PAGINA DI CARICAMENTO

ThemeData get_themes(int index) {
  List<ThemeData> temi = [];

  ThemeData tema1() {
    final ThemeData base = ThemeData();
    return base.copyWith(
      primaryColor: Color.fromRGBO(218, 34, 103, 1), // Rosa
      accentColor: Color.fromRGBO(13, 18, 57, 1), // Blu

      colorScheme: ColorScheme(
          primary: Color.fromRGBO(218, 34, 103, 1), // Rosa
          primaryVariant: Color.fromRGBO(0, 0, 0, 1), // NERO,
          secondary: Color.fromRGBO(13, 18, 57, 1), // Blu
          secondaryVariant: Color.fromRGBO(0, 0, 0, 1), // NERO,
          surface: Color.fromRGBO(0, 0, 0, 1), // NERO,
          background: Color.fromRGBO(0, 0, 0, 1), // NERO,
          error: Color.fromRGBO(0, 0, 0, 1), // NERO,
          onPrimary: Color.fromRGBO(0, 0, 0, 1), // NERO,
          onSecondary: Color.fromRGBO(0, 0, 0, 1), // NEROll,
          onSurface: Color.fromRGBO(0, 0, 0, 1), // NERO,
          onBackground: Color.fromRGBO(0, 0, 0, 1), // NERO,
          onError: Color.fromRGBO(0, 0, 0, 1), // NERO,
          brightness: Brightness.dark),

      focusColor: Color.fromRGBO(13, 18, 57, 1), // blu
      backgroundColor: Color.fromRGBO(255, 255, 255, 255), // bianco
      textTheme: TextTheme(
        headline1: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(13, 18, 57, 1),
            fontFamily: 'ShipporiMincho'),
        headline6: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
            fontFamily: 'ShipporiMincho',
            fontWeight: FontWeight.bold),
        headline4: TextStyle(
            fontSize: 22.0,
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: 'Newsreader'),
        bodyText2: TextStyle(
            fontSize: 15.0, fontFamily: 'Newsreader', color: Colors.white),
        bodyText1: TextStyle(
          fontSize: 14.0,
          fontFamily: 'Newsreader',
          color: Colors.black,
        ),
      ),
      chipTheme: ChipThemeData(
          backgroundColor: Color.fromRGBO(13, 18, 57, 1), //blu
          brightness: Brightness.light,
          disabledColor: Color.fromRGBO(13, 18, 57, 1),
          labelStyle: TextStyle(fontSize: 15, color: Colors.white),
          padding: EdgeInsets.only(left: 0),
          secondaryLabelStyle: TextStyle(fontSize: 10, color: Colors.black),
          secondarySelectedColor: Color.fromRGBO(13, 18, 57, 1),
          selectedColor: Color.fromRGBO(13, 18, 57, 1)),

      canvasColor: Color.fromRGBO(248, 211, 226, 1), // Rosa
    );
  }

  temi.add(tema1());

  ThemeData tema2() {
    final ThemeData base = ThemeData();
    return base.copyWith(
      primaryColor: Color.fromRGBO(255, 255, 255, 1), // Bianco

      colorScheme: ColorScheme(
          primary: Color.fromRGBO(255, 255, 255, 1), // Bianco
          primaryVariant: Color.fromRGBO(0, 0, 0, 1), // NERO,
          secondary: Color.fromRGBO(0, 0, 0, 1), // Nero
          secondaryVariant: Color.fromRGBO(0, 0, 0, 1), // NERO,
          surface: Color.fromRGBO(0, 0, 0, 1), // NERO,
          background: Color.fromRGBO(0, 0, 0, 1), // NERO,
          error: Color.fromRGBO(0, 0, 0, 1), // NERO,
          onPrimary: Color.fromRGBO(0, 0, 0, 1), // NERO,
          onSecondary: Color.fromRGBO(0, 0, 0, 1), // NEROll,
          onSurface: Color.fromRGBO(0, 0, 0, 1), // NERO,
          onBackground: Color.fromRGBO(0, 0, 0, 1), // NERO,
          onError: Color.fromRGBO(0, 0, 0, 1), // NERO,
          brightness: Brightness.dark),

      focusColor: Color.fromRGBO(255, 255, 255, 1), // Nero
      backgroundColor: Color.fromRGBO(255, 255, 255, 1), // Bianco
      textTheme: TextTheme(
        headline1: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontFamily: 'ShipporiMincho'),
        headline6: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
            fontFamily: 'ShipporiMincho',
            fontWeight: FontWeight.bold),
        headline4: TextStyle(
            fontSize: 22.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontFamily: 'Newsreader'),
        bodyText2: TextStyle(
          fontSize: 15.0,
          fontFamily: 'Newsreader',
          color: Colors.white,
        ),
        bodyText1: TextStyle(
          fontSize: 14.0,
          fontFamily: 'Newsreader',
          color: Colors.black,
        ),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: Color.fromRGBO(0, 0, 0, 1), // Nero,
        brightness: Brightness.light,
        disabledColor: Color.fromRGBO(13, 18, 57, 1),
        labelStyle: TextStyle(fontSize: 15, color: Colors.black),
        padding: EdgeInsets.only(left: 0),
        secondaryLabelStyle: TextStyle(fontSize: 10, color: Colors.black),
        secondarySelectedColor: Color.fromRGBO(0, 0, 0, 1), // Nero
        selectedColor: Color.fromRGBO(0, 0, 0, 1), // Nero
      ),

      canvasColor: Color.fromRGBO(0, 0, 0, 1), // Nero
    );
  }

  temi.add(tema2());

  ThemeData tema3() {
    final ThemeData base = ThemeData();
    return base.copyWith(
      primaryColor: Color.fromRGBO(0, 0, 0, 1), // NERO
      //accentColor: Color.fromRGBO(233, 193, 33, 1), // SENAPE

      colorScheme: ColorScheme(
          primary: Color.fromRGBO(0, 0, 0, 1), // NERO,
          primaryVariant: Color.fromRGBO(0, 0, 0, 1), // NERO,
          secondary: Color.fromRGBO(233, 193, 33, 1), // SENAPE,
          secondaryVariant: Color.fromRGBO(0, 0, 0, 1), // NERO,
          surface: Color.fromRGBO(0, 0, 0, 1), // NERO,
          background: Color.fromRGBO(0, 0, 0, 1), // NERO,
          error: Color.fromRGBO(0, 0, 0, 1), // NERO,
          onPrimary: Color.fromRGBO(0, 0, 0, 1), // NERO,
          onSecondary: Color.fromRGBO(0, 0, 0, 1), // NEROll,
          onSurface: Color.fromRGBO(0, 0, 0, 1), // NERO,
          onBackground: Color.fromRGBO(0, 0, 0, 1), // NERO,
          onError: Color.fromRGBO(0, 0, 0, 1), // NERO,
          brightness: Brightness.dark),

      //focusColor: Color.fromRGBO(233, 193, 33, 1), // SENAPE
      backgroundColor: Color.fromRGBO(255, 255, 255, 1), // Bianco

      textTheme: TextTheme(
        headline1: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(233, 193, 33, 1),
            fontFamily: 'ShipporiMincho'),
        headline6: TextStyle(
            fontSize: 20.0,
            color: Colors.black,
            fontFamily: 'ShipporiMincho',
            fontWeight: FontWeight.bold),
        headline4: TextStyle(
            fontSize: 22.0,
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: 'Newsreader'),
        bodyText2: TextStyle(
            fontSize: 15.0, fontFamily: 'Newsreader', color: Colors.black),
        bodyText1: TextStyle(
          fontSize: 14.0,
          fontFamily: 'Newsreader',
          color: Colors.black,
        ),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: Color.fromRGBO(233, 193, 33, 1), // SENAPE,
        brightness: Brightness.light,
        disabledColor: Color.fromRGBO(135, 18, 57, 1),
        labelStyle: TextStyle(fontSize: 15, color: Colors.white),
        padding: EdgeInsets.only(left: 0),
        secondaryLabelStyle: TextStyle(fontSize: 10, color: Colors.black),
        secondarySelectedColor: Color.fromRGBO(0, 0, 0, 1), // Nero
        selectedColor: Color.fromRGBO(0, 0, 0, 1), // Nero
      ),

      canvasColor: Color.fromRGBO(0, 0, 0, 1), // Nero
    );
  }

  temi.add(tema3());

  return temi[index];
}
