import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:political_balance_news/Categorie.dart';
import 'package:political_balance_news/Data.dart';
import 'package:political_balance_news/News.dart';
import 'News.dart';
import 'Animazione.dart';
import 'Temi.dart';
import 'package:toggle_switch/toggle_switch.dart';



 StreamController<String> stc1 = StreamController<String>.broadcast();
 StreamController<String> stc2 = StreamController<String>.broadcast();
 StreamController<String> stc3 = StreamController<String>.broadcast();

 

class Homepage extends StatefulWidget {
  

  Homepage1 createState() => Homepage1();
  final Stream<String> stream1 =stc1.stream;
  final Stream<String> stream2 =stc2.stream;
  final Stream<String> stream3 =stc3.stream;
}

class Homepage1 extends State<Homepage> {
 static List<ArticleModel> articles = [];
  // ignore: deprecated_member_use
  List<CatMod> categorie = [];
  static bool loading = true;
  final GlobalKey<ScaffoldState> _scaffoldKey= GlobalKey<ScaffoldState>();
  TextEditingController _textController;
   FocusNode myFocusNode;
  

    String a=null;
    String c=null;
    String l=null;
    String q=null;
    
     int toggle = 2;



    
    void initState() {
    super.initState();

    categorie = getCat();
    
    
    getNews(c,l,q,a);

     

    widget.stream1.listen((tipo1) {Stato(); getNews(tipo1,l,q,a); });
    widget.stream2.listen((q) {Stato(); getNews("",l,q,a); });
    widget.stream3.listen((a) {Stato();getNews(c, l, q, a);});
  }



  
  
  void Stato()
  {
    setState(() {
      loading = true;
    });
  }


  


  getNews(c,l,q,a) async {
    News NuovaNews = News();
    await NuovaNews.getNews(c,l,q,a);
    articles = NuovaNews.news;
    setState(() {
      loading = false;
    });
  }




  void _openEndDrawer() {
    _scaffoldKey.currentState.openEndDrawer();
  }

  Widget build(BuildContext) {
   

   
   
            //-------------------------------APPBAR CON SEARCH BAR----------------------------------------------//   

    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: true,
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar
      (
        
        backgroundColor: Colors.transparent,
        elevation: 0.0,
              
              title: Container
              (
                padding: EdgeInsets.only(left: 5),
                width: 350,
                height: 35,
                child: CupertinoSearchTextField 
                (
                  
                  
                  
                  placeholder: "Cerca",
                  controller: _textController,
                  backgroundColor: Colors.white,
                  onSubmitted: (String value)
                  {
                    
                    q=value;
                    stc2.add(q);
                    //q=null;
                    _textController.clear();
                    
                  },
                )


                
              
            ),


        // ICONA DELL' APPBAR
            actions: <Widget>
            [
              
               IconButton
              (
                icon: Icon(Icons.more_horiz,color: Theme.of(context).accentColor,),
                iconSize: 35,
                onPressed: ()
                {
                  FocusScopeNode currentFocus = FocusScope.of(context);

                  if (!currentFocus.hasPrimaryFocus) {
                   currentFocus.unfocus();
                  }
                  _openEndDrawer();
                } ,

              ),
              
            ],

          //ICONA DELL' APPBAR
            
      ),

          //-------------------------------APPBAR CON SEARCH BAR----------------------------------------------//  








          //-----------------------DRAWER-------------------------------------//

      endDrawer: Theme
      ( 
      data: Theme.of(context).copyWith
      (
        canvasColor: Theme.of(context).accentColor
      ),
      child:Drawer
      (
      child: ListView(
      padding: EdgeInsets.zero,
      children:  <Widget>[


        Container(
          height: 100.0,
          child: DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: Text(
              'Political Balance News',
              style: Theme.of(context).textTheme.headline1 
            ),
          )),


        ListTile
        (
          leading: Icon(Icons.message,color: Colors.white),
          title: Text('Messages',style: TextStyle(color: Colors.white),),
          onTap: ()
          {
            
          },
          
        ),

        ListTile
        (
          leading: Icon(Icons.account_circle,color: Colors.white),
          title: Text('Profile',style: TextStyle(color: Colors.white)),
          onTap: ()
          {
            
          },
        ),

        ListTile
        (
          leading: Icon(Icons.settings,color: Colors.white,),
          title: Text('Temi',style: TextStyle(color: Colors.white)),
          onTap: ()
          {
            
            Navigator.push
            (
              context,
              MaterialPageRoute(builder: (context)=>tema()) 
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
                child: CircularProgressIndicator(),
              ),
            )



          : Stack(children: <Widget>[
            

            Container(
            
              alignment: Alignment.topCenter,
              child: ToggleSwitch(
            initialLabelIndex: toggle,
            totalSwitches: 4,
            inactiveBgColor: Theme.of(context).primaryColor,
            activeBgColor: [Theme.of(context).accentColor],
            inactiveFgColor: Theme.of(context).accentColor,
            labels: ['Sinistra', 'Centro','Tutto', 'Destra'],
            onToggle: (index) {
             
            toggle = index;
            print('Sono index $index.toString()');
            a=index.toString();
            stc3.add(a);

          },
          ),),






            //-----------------------CATEGORIE-------------------------------------//
             Container
              (
              
               margin: EdgeInsets.only(top: 40),
                child: Column
                (
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>
                  [
                    Container
                    (
                      height: 80,
                      child: ListView.builder
                      (
                        itemCount: categorie.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context,index)
                        {
                          return Categorie
                          (
                            immagine: categorie[index].urlimm,
                            nome: categorie[index].nomecat,
                            tipo1: categorie[index].tipo,
                            
                          );
                        },
                      ),
                    )
                  ],
                )
              ),

        //-----------------------CATEGORIE-------------------------------------//







            
            //-----------------------ARTICLEVIEW-------------------------------------//

              Padding(
                  padding: EdgeInsets.only(left: 15,right: 15,top: 50,bottom: 50),
                  
                  child: Container(
                    margin: EdgeInsets.only(bottom: 50),
                    child: Card(
                        color: Theme.of(context).focusColor, 
                        
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
}// CLASSE HOMEPAGE1




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
            Text(
              titolo,
              style: Theme.of(context).textTheme.headline6
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              desc,
              style: Theme.of(context).textTheme.bodyText2//TextStyle(color: Colors.grey.shade400),
            ),
            Card(margin: EdgeInsets.only(bottom: 15)),
          ],
        ));
  }
}


//-----------------------ARTICLEVIEW-------------------------------------//

