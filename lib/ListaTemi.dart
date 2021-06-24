import 'package:flutter/material.dart';
// ignore: deprecated_member_use


// LEGENDA 

// FOCUS COLOR = COLORE DEL SECONDO SFONDO PICCOLO CHE CONTIENE ARTICOLI
// PRIMARY COLOR = COLORE DELLO SFONDO PRINCIPALE E DEL DRAWER HEADER
// ACCENT COLOR = CORPO DRAWER E ICONA
//BODY TEXT2 COLORE DELLA DESCRIZIONE ARTICOLO
//HEADLINE 6 TITOLO ARTICOLO
//HEADLINE 4 DESCRIZIONE SWITCH 
//HEADLINE 1 SCRITTA SCHERMATA PAGINA DI CARICAMENTO


ThemeData get_themes(int index)
{
  List<ThemeData> temi = [];

  ThemeData tema1()
  {

  final ThemeData base = ThemeData();
  return base.copyWith
    (
      primaryColor: Color.fromRGBO(218,34,103,1), // Rosa
      accentColor:  Color.fromRGBO(13,18,57,1), // Blu
      focusColor: Color.fromRGBO(13,18,57,1), // blu
      backgroundColor:  Color.fromRGBO(255,255,255,255) ,// bianco
      textTheme: TextTheme(
        headline1: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold,color: Colors.black),
        headline6: TextStyle(fontSize: 20.0, color: Colors.white),
        headline4: TextStyle(fontSize: 22.0, color: Colors.white,fontWeight: FontWeight.bold),
        bodyText2: TextStyle(fontSize: 15.0, fontFamily: 'Hind',color: Colors.white)),
      chipTheme: ChipThemeData
      (
        backgroundColor: Color.fromRGBO(13,18,57,1),  //blu
        brightness: Brightness.light, 
        disabledColor: Color.fromRGBO(13,18,57,1), 
        labelStyle: TextStyle(fontSize: 15,color: Colors.white), 
        padding: EdgeInsets.only(left: 0),
        secondaryLabelStyle: TextStyle(fontSize: 10,color: Colors.black), 
        secondarySelectedColor: Color.fromRGBO(13,18,57,1), 
        selectedColor: Color.fromRGBO(13,18,57,1)
      ),

      canvasColor: Color.fromRGBO(248,211,226,1), // Rosa
    );
    
  }

  temi.add(tema1());

  ThemeData tema2()
  {

  final ThemeData base = ThemeData();
  return base.copyWith
    (
      primaryColor: Color.fromRGBO(255,255,255,1), // Bianco
      accentColor: Color.fromRGBO(0,0,0,1), // Nero
      focusColor: Color.fromRGBO(255,255,255,1), // Nero
      backgroundColor:  Color.fromRGBO(255,255,255,1), // Bianco
      textTheme: TextTheme(
        headline1: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold,color: Colors.black),
        headline6: TextStyle(fontSize: 20.0, color: Colors.black),
        headline4: TextStyle(fontSize: 22.0, color: Colors.black,fontWeight: FontWeight.bold),
        bodyText2: TextStyle(fontSize: 15.0, fontFamily: 'Hind',color: Colors.black)),
      chipTheme: ChipThemeData
      (
        backgroundColor: Color.fromRGBO(0,0,0,1), // Nero,
        brightness: Brightness.light, 
        disabledColor: Color.fromRGBO(13,18,57,1), 
        labelStyle: TextStyle(fontSize: 15,color: Colors.white), 
        padding: EdgeInsets.only(left: 0),
        secondaryLabelStyle: TextStyle(fontSize: 10,color: Colors.black), 
        secondarySelectedColor: Color.fromRGBO(0,0,0,1), // Nero
        selectedColor: Color.fromRGBO(0,0,0,1), // Nero
      ),

      canvasColor: Color.fromRGBO(0,0,0,1), // Nero
    );
  }
  temi.add(tema2());




 ThemeData tema3()
  {

  final ThemeData base = ThemeData();
  return base.copyWith
    (
      primaryColor: Color.fromRGBO(0,0,0,1), // NERO
      accentColor: Color.fromRGBO(233,193,33,1), // SENAPE
      focusColor: Color.fromRGBO(233,193,33,1), // SENAPE
      backgroundColor:  Color.fromRGBO(255,255,255,1), // Bianco
      textTheme: TextTheme( 
        headline1: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold,color: Color.fromRGBO(233,193,33,1)),
        headline6: TextStyle(fontSize: 20.0, color: Colors.black),
        headline4: TextStyle(fontSize: 22.0, color: Colors.white,fontWeight: FontWeight.bold),
        bodyText2: TextStyle(fontSize: 15.0, fontFamily: 'Hind',color: Colors.black)),
      chipTheme: ChipThemeData
      (
        backgroundColor: Color.fromRGBO(233,193,33,1), // SENAPE,
        brightness: Brightness.light, 
        disabledColor: Color.fromRGBO(13,18,57,1), 
        labelStyle: TextStyle(fontSize: 15,color: Colors.white), 
        padding: EdgeInsets.only(left: 0),
        secondaryLabelStyle: TextStyle(fontSize: 10,color: Colors.black), 
        secondarySelectedColor: Color.fromRGBO(0,0,0,1), // Nero
        selectedColor: Color.fromRGBO(0,0,0,1), // Nero
      ),

      canvasColor: Color.fromRGBO(0,0,0,1), // Nero
    );
  }

  temi.add(tema3());





return temi[index];

} 


  








/*class MyAppTheme {
  Color bg1;
  Color accent1;
  bool isDark;
 
  /// Default constructor
  MyAppTheme({@required this.isDark});
 
  ThemeData get themeData {
    /// Create a TextTheme and ColorScheme, that we can use to generate ThemeData
    TextTheme txtTheme = (isDark ? ThemeData.dark() : ThemeData.light()).textTheme;
    Color txtColor = txtTheme.bodyText1.color;
    ColorScheme colorScheme = ColorScheme(
        // Decide how you want to apply your own custom them, to the MaterialApp
        brightness: isDark ? Brightness.dark : Brightness.light,
        primary: accent1,
        primaryVariant: accent1,
        secondary: accent1,
        secondaryVariant: accent1,
        background: bg1,
        surface: bg1,
        onBackground: txtColor,
        onSurface: txtColor,
        onError: Colors.white,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        error: Colors.red.shade400);
 
    /// Now that we have ColorScheme and TextTheme, we can create the ThemeData
    var t = ThemeData.from(textTheme: txtTheme, colorScheme: colorScheme)
        // We can also add on some extra properties that ColorScheme seems to miss
        .copyWith(buttonColor: accent1, cursorColor: accent1, highlightColor: accent1, toggleableActiveColor: accent1);
 
    /// Return the themeData which MaterialApp can now use
    return t;*/