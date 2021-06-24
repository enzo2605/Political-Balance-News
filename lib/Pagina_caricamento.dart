 import 'dart:async';

import 'package:flutter/material.dart';
import 'Homepage.dart';

class Pci extends StatefulWidget {
  

  Pagina_caricamento createState() => Pagina_caricamento();
  
}

class Pagina_caricamento extends State<Pci> {
  @override
  static bool load = true;

  void Stato1() async
  {
    setState(() {
      load = false;
    });
  }


    void initState() 
    {
    super.initState();
    Stato1();
    }

  Widget build(BuildContext context) 
  {

    
  
    return Scaffold(
      backgroundColor: Color.fromRGBO(67, 67, 67,1),
      body: Stack
      (
        children: <Widget>
      [
        Align(
            alignment: Alignment(0.0, 0.0),
            child: Image.asset('images/weight_scale_black_bg.png',fit: BoxFit.cover,)),
        Align(
          alignment: Alignment(0.0, 0.3),
          child: Text(
            "Political Balance news",
            textDirection: TextDirection.ltr,
            style: TextStyle(decoration:TextDecoration.none ,fontSize: 25, fontStyle: FontStyle.italic,color: Colors.white),
          ),
        ),
    Container(
            child: new Directionality
              (
              textDirection: TextDirection.ltr,
              child: futuro().futuro1(context),
              
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
                builder: (context) => Homepage()
              ),
              (route) => false
            );
      }
            );
            
            
            
            
            return Container(width: 0.0,height: 0.0,);
            }

            
  }