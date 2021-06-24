
import 'package:flutter/cupertino.dart';
import 'package:political_balance_news/ArticleView.dart';
class Animazione{
  static Route rotta(String requrl) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>ArticleView(artUrl: requrl),
    transitionDuration: Duration(seconds: 2),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(1.0, 0.0);
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}



  
}