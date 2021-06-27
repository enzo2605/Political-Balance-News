//PAGINA PER IL DISPLAY DI INFO FATTA SOLO DI PARTI GRAFICHE E' PRESENTE UN TITOLO UN IMMAGINE E UNA DESCRIZIONE


import 'package:flutter/material.dart';
class informazioni extends StatefulWidget {

  @override
  info createState() => info();
  
}

class info extends State<informazioni> {
  @override
  
  Widget build(BuildContext context) {
    return Container
    (
      
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
      appBar:  AppBar
        (
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        
        
        title:Column
        (

            children: 
            [
              Text("Info App",style: TextStyle(color:Theme.of(context).accentColor,)),
              
              
            ],
        ), 

        
        
        leading: IconButton
        (
          icon: Icon(Icons.arrow_back),
          color: Theme.of(context).accentColor,
          onPressed: ()
          {
            Navigator.pop(context);
          },
        ),
        ) ,



      body: Column
      (
        children: [
          Container(
            padding: EdgeInsets.all(20),
          child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
              
                child: Image.network('https://www.allsides.com/sites/default/files/AllSidesMediaBiasChart-Version4.1.jpg'))),
          Container(
                    padding: EdgeInsets.only(left: 15,right: 15),

                    child: RichText(
                      textAlign: TextAlign.left,
                      text: TextSpan(
                        
                        text: "L' applicazione Political Balance news riprende comportamenti d'oltre oceano e d'oltre manica per la classificazione dello spettro politico dei giornali, lo scopo dunque è indirizzato nell' instaurare nel lettore una giusta distinzione e apertura mentale per quanto concerne al ragionamento di diversi articoli riguardanti lo stesso argomento ",
                        style: Theme.of(context).textTheme.bodyText2

                      ),

                    )),
                    
                  ]
                  
      )

    ));
  }
}