
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Homepage.dart';
import 'News.dart';

class Categorie extends StatelessWidget
{
  final immagine,nome,tipo1;
  Categorie({this.immagine,this.nome,this.tipo1});
   @override
  Widget build(BuildContext context) {
    
    return InkWell
    (
      onTap : ()
      {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
        stc.add(tipo1);
        
        
      },
      
   




      child: Stack
      (

        children: <Widget>
        [

              
              Container
              (
                padding: EdgeInsets.all(10),
                
                 child: 
                    Chip(label: Text(nome),labelStyle: TextStyle(color: Theme.of(context).primaryColor),)
                    
              ),

          
          
        ]
      ),
      
    ) ;
  }

  
}



class CatMod
{
  String nomecat;
  String urlimm;
  String tipo;
}