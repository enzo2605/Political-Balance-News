/*CLASSE CHE CONSENYE LA VISIONE DELL'ARTICOLO*/



import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleView extends StatefulWidget 
{
  final String artUrl;
  ArticleView({this.artUrl});
  Vs createState()=>Vs();
}

class Vs extends State<ArticleView>
{

  final Completer<WebViewController> completer = Completer<WebViewController>();

  Widget build(BuildContext context)
  {
    return Container(

      child: WebView(

        initialUrl: widget.artUrl,
        onWebViewCreated: ((WebViewController webViewController)                  //ESSENZIALMENTE APRE IL BROWSER DALL'APP
        {
          completer.complete(webViewController);
        }),

      )


    );
  }
}
