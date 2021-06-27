// E' UNA PAGINA FITTIZIA DI CARICAMENTO PERMETTE DI FAR CAPIRE ALL'UTENTE QUALE APP HA APERTO, E NASCONDERE 
//IL CAMBIO IMPROVVISO DI TEMA NEL MOMENTO IN CUI LEGGE DA FILE 

import 'dart:async';
import 'package:flutter/material.dart';
import 'Homepage.dart';

class Pci extends StatefulWidget {
  

  Pagina_caricamento createState() => Pagina_caricamento();
  
}

class Pagina_caricamento extends State<Pci> {
  @override



    void initState() 
    {
    super.initState();
    }

  Widget build(BuildContext context) 
  {

    
  
    return Scaffold(
      backgroundColor: Color.fromRGBO(255,255,255,1),
      body: Stack
      (
        children: <Widget>
      [
        Align(
            alignment: Alignment(0.0, 0.0),
            child: Image.asset('images/weight_scale_black_bg.png',fit: BoxFit.cover,)),
        Align(                                                                                          // PURAMENTE GRAFICA
          alignment: Alignment(0.0, 0.3),
          child: Text(
            "Political Balance news",
            textDirection: TextDirection.ltr,
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
    Container(
            child: new Directionality
              (
              textDirection: TextDirection.ltr,
              child: futuro().futuro1(context),                                                     // TIMER DI 3 SECONDI PER POI PASSARE ALL'HOMEPAGE
              
            )
              )


      ]

      )
      
    

      

    );

  }

} 


class futuro
{
  Widget futuro1(BuildContext context)
  {
     Future.delayed(Duration(seconds: 3)).then((value)
      {
            Navigator.pushAndRemoveUntil
            (
              context,
              MaterialPageRoute
              (   
                builder: (context) => Homepage()                                      // TIMER DI 3 SECONDI PER POI PASSARE ALL'HOMEPAGE
              ),
              (route) => false
            );
      }
            );
            return Container(width: 0.0,height: 0.0,);
            }

            
  }