

/* LA SEGUENTE CLASSE PROVVEDE ALL'INSERIMENTO DI UN'ANIMAZIONE
NEL MOMENTO IN CUI SI CLICCA SU UN DETERMINATO ARTICOLO 
L'ANIMAZIONE INIZIA DA DESTRA VERSO SINISTRA E LA SUA
DURATA E' DI DUE SECONDI QUANDO SI CLICCA SULL'ARTICOLO*/

import 'package:flutter/cupertino.dart';
import 'package:political_balance_news/ArticleView.dart';

class Animazione{
  static Route rotta(String requrl) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>ArticleView(artUrl: requrl),
    transitionDuration: Duration(seconds: 2),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(1.0, 0.0);                                                         // DA DOVE INIZIA L'ANIMAZIONE
      var end = Offset.zero;                                                                // DOVE FINISCE 
      var curve = Curves.ease;                                                              // PROPRIETA'  PER ANIMAZIONE

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));            //INTERPOLA DAL VALORE INIZIALE AL FINALE LA TRANSIZIONE

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}



  
}