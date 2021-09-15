import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:political_balance_news/Categorie.dart';
import 'package:political_balance_news/Data.dart';
import 'package:political_balance_news/News.dart';
import 'package:political_balance_news/info.dart';
import 'News.dart';
import 'Animazione.dart';
import 'Temi.dart';
import 'package:toggle_switch/toggle_switch.dart';

StreamController<String> stc1 = StreamController<String>.broadcast();           //STREAM PER CATEGORIA
StreamController<String> stc2 = StreamController<String>.broadcast();           //STREAM PER RICERCA PAROLA
StreamController<String> stc3 = StreamController<String>.broadcast();           //STREAM PER IL TOGGLE SWITCH                        
                                          

class Homepage extends StatefulWidget {
  Homepage1 createState() => Homepage1();
  final Stream<String> stream1 = stc1.stream;
  final Stream<String> stream2 = stc2.stream;
  final Stream<String> stream3 = stc3.stream;
}

class Homepage1 extends State<Homepage> {
  static List<ArticleModel> articles = [];                                      // LISTA DEGLI ARTICOLI
  List<CatMod> categorie = [];                                                  // LISTA DELLE CATEGORIE
  static bool loading = true;                                                   // BOOL PER IL CARICAMENTO
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();     //CHIAVE CHE USO PER APRIRE IL DRAWER
                                                     
  TextEditingController _textController;                                        //TEXTCONTROLLER PER LA CUPERTINOSEARCHTEXTFIELD
                                                                

  String a = null;                                                              //GUARDA I COMMENTI IN NEWS.DART PER CAPIRE COSA SONO
  String c = null;
  String l = null;
  String q = null;

  int toggle = 2;                                                                // IL TOGGLE INIZIALMENTE è SEMPRE SU DUE OVVERO TUTTO PER FAR CAPIRE CHE SARANNO VISTI TUTTI GLI ARTICOLI SENZA DISTINZIONE POLITICA

  void initState() {
    super.initState();

    categorie = getCat();

    getNews(c, l, q, a);

    widget.stream1.listen((tipo1) {
      Stato();
      getNews(tipo1, l, q, a);
    });                                                                         // ARRIVA IL DATO CATEGORIA
    widget.stream2.listen((q) {
      Stato();
      getNews("", l, q, a);
    });                                                                         // ARRIVA IL DATO PAROLA CERCATA
    widget.stream3.listen((a) {
      Stato();
      getNews(c, l, q, a);
    });                                                                         // ARRIVA INDICE DEL TOGGLE SWITCH
  }

  void Stato() {
    setState(() {
      loading = true;                                                           // SE E' TRUE VERRA' FATTO UN DISPLAY DI CARICAMENTO
    });
  }

  getNews(c, l, q, a) async {
                                                                                // METODO GETNEWS PRESENTE IN NEWS.DART
    News NuovaNews = News();                                                    // CREO CLASSE NUOVANEWS
    await NuovaNews.getNews(
        c, l, q, a);                                                            // RICHIAMO IL METODO E ASPETTO CHE SI COMPLETI
    articles = NuovaNews.news;                                                  // OGNI ARTICOLO ORA è ASSEGNATO ALLA LISTA
    setState(() {
      loading = false;
                                                                                // DUNQUE DIRO' AL BOOL DI ESSERE FALSO ED ELIMINARE LA CIRUCULAR PROGRESSION
    });
  }

  void _openEndDrawer() {
    _scaffoldKey.currentState.openEndDrawer();                                  // PER APRIRE IL DRAWER
  }

  Widget build(BuildContext) {
    //-------------------------------APPBAR CON SEARCH BAR----------------------------------------------//

    return GestureDetector(
      // TUTTA LA MIA HOMEPAGE E' RACCHIUSA IN GESTURE DETECTOR PER CHIUDERE
      onTap: () {
        // LA CUPERTINOSEARCHTEXTFIELD SE CLICCO OVUNQUE AL DI FUORI DI ESSA
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();                                               // PER PERMETTERE L'UNFOCUS
        }
      },
      child: Scaffold(
        key: _scaffoldKey,                                                      // NECESSARIA PER IL DRAWER
        resizeToAvoidBottomInset: true,                                         // PER EVITARE GLITCH CON LA TASTIERA
        backgroundColor:
            Theme.of(context).colorScheme.primary,                              // ISTRUZIONE LEGATA AI TEMI

        // L'APP BAR CONTERRA' LA CUPERTINOSEARCHTEXTFIELD E ICONA PER APRIRE IL DRAWER
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,

          title: Container(
              padding: EdgeInsets.only(left: 5),
              width: 350,
              height: 35,
              child: CupertinoSearchTextField(
                placeholder: "Cerca",
                controller: _textController,
                backgroundColor: Colors.white,
                onSubmitted: (String value) {
                  q = value;
                  stc2.add(q);
                  _textController.clear();
                },
              )),

          // ICONA DELL' APPBAR
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.more_horiz,
                color: Theme.of(context).colorScheme.secondary,
              ),
              iconSize: 35,
              onPressed: () {
                FocusScopeNode currentFocus = FocusScope.of(context);
                currentFocus.unfocus();

                _openEndDrawer();
              },
            ),
          ],

          //ICONA DELL' APPBAR
        ),

        //-------------------------------APPBAR CON SEARCH BAR----------------------------------------------//

        //-----------------------DRAWER-------------------------------------//

        endDrawer: Theme(
            data: Theme.of(context)
                .copyWith(canvasColor: Theme.of(context).colorScheme.secondary),
            child: Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  Container(
                      height: 100.0,
                      child: DrawerHeader(
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        child: Text(
                            // TESTO AL DI SOPRA DEL DRAWER
                            'Political Balance News',
                            style: Theme.of(context).textTheme.headline1),
                      )),

                  // LIST TILE (NE SONO 2) PER DEFINIRE CHE FARE UNA VOLTA APERTO IL DRAWER
                  ListTile(
                    leading: Icon(Icons.info,
                        color: Theme.of(context).colorScheme.primary),
                    title: Text(
                      'Informazioni app',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  informazioni()) // VA ALLA SCHERMATA INFORMAZIONI
                          );
                    },
                  ),

                  ListTile(
                    leading: Icon(Icons.settings,
                        color: Theme.of(context).colorScheme.primary),
                    title: Text('Temi',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary)),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  tema()) // VA NELLA PAGINA PER CAMBIARE I TEMI
                          );
                    },
                  ),
                ],
              ),
            )),

        //-----------------------DRAWER-------------------------------------//

        //-----------------------BODY-------------------------------------//
        body: loading
            ? Center(
                child: Container(
                  child: CircularProgressIndicator(
                    color: Theme.of(context).colorScheme.secondary,
                  ), // SCHERMATA DI CARICAMENTO
                ),
              )
            : Stack(children: <Widget>[
                Container(
                  alignment: Alignment.topCenter,
                  child: ToggleSwitch(
                    initialLabelIndex: toggle,
                    totalSwitches: 4,
                    inactiveBgColor: Theme.of(context).colorScheme.primary,
                    activeBgColor: [
                      Theme.of(context).colorScheme.secondary
                    ], // TOGGLE SWITCH
                    inactiveFgColor: Theme.of(context).colorScheme.secondary,
                    labels: ['Sinistra', 'Centro', 'Tutto', 'Destra'],
                    onToggle: (index) {
                      toggle = index;
                      a = index.toString();
                      stc3.add(
                          a);                                                   // UTILIZZO DELLO STREAM C'E' UN CAST PER MOTIVI LEGATI A COMPLESSITA' DI CODICE
                                                                                // DA QUESTO COMMENTO IN POI C'E' SOLO GRAFICA ED UNA CLASSE SEMPRE PER MOTIVI GRAFICI
                    },                                                          // PER CUI IL CODICE E' AUTO ESPLICATIVO DATO LE PREMESSE FATTE NEI COMMENTI
                  ),
                ),

                //-----------------------CATEGORIE-------------------------------------//
                Container(
                    margin: EdgeInsets.only(top: 40),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          height: 80,
                          child: ListView.builder(
                            itemCount: categorie.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Categorie(
                                nome: categorie[index].nomecat,
                                tipo1: categorie[index].tipo,
                              );
                            },
                          ),
                        )
                      ],
                    )),

                //-----------------------CATEGORIE-------------------------------------//

                //-----------------------ARTICLEVIEW-------------------------------------//

                Padding(
                    padding: EdgeInsets.only(
                        left: 15, right: 15, top: 50, bottom: 50),
                    child: Container(
                      margin: EdgeInsets.only(bottom: 50),
                      child: Card(
                          color: Theme.of(context).colorScheme.secondary,
                          child: Padding(
                              padding: EdgeInsets.all(10),
                              child: ListView.builder(
                                  itemCount: articles.length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return Articolo(
                                      imageUrl: articles[index].urlToImage,
                                      titolo: articles[index].title,
                                      desc: articles[index].description,
                                      url: articles[index].url,
                                    );
                                  }))),
                    )),

                //-----------------------ARTICLEVIEW-------------------------------------//
              ]),
        //-----------------------BODY-------------------------------------//
      ),
    );
  }
} // CLASSE HOMEPAGE1

//-----------------------ARTICLEVIEW-------------------------------------//

class Articolo extends StatelessWidget {
  final String imageUrl, titolo, desc, url;
  Articolo(
      {@required this.imageUrl,
      @required this.titolo,
      @required this.desc,
      @required this.url});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);

          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }

          Route rot = Animazione.rotta(url);
          Navigator.of(context).push(rot);
        },
        child: Column(
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(imageUrl)),
            Text(titolo, style: Theme.of(context).textTheme.headline6),
            SizedBox(
              height: 8,
            ),
            Text(desc,
                style: Theme.of(context)
                    .textTheme
                    .bodyText2 //TextStyle(color: Colors.grey.shade400),
                ),
            Card(margin: EdgeInsets.only(bottom: 15)),
          ],
        ));
  }
}

//-----------------------ARTICLEVIEW-------------------------------------//
