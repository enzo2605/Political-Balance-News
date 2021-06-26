//CLASSE CHE PERMETTE DI VISUALIZZARE LE CATEGORIE

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Homepage.dart';

class Categorie extends StatelessWidget
{
  final nome,tipo1;
  
  Categorie({this.nome,this.tipo1});        // SONO RICHESTI I SEGUENTI PARAMETRI
   @override
  Widget build(BuildContext context) {
    
    return InkWell                                        // PER INCLUDERE PICCOLA ANIMAZIONE AL TOCCO
    (
      onTap : ()
      {
        FocusScopeNode currentFocus = FocusScope.of(context);       //LE RIGHE DI CODICE RIGUARDANTE IL FOCUS VENGONO UTILIZZATE
                                                                    // PER NON PERMETTERE AL CUPERTINOSEARCHTEXTFIELD(E' IN HOMEPAGE) DI CONTINUARE AD AVERE IL FOCUS
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
        stc1.add(tipo1);                                             // AL TOCCO COMUNICA AD UNO DEI TRE STREAM DELL'HOMEPAGE CHE E' ARRIVATO IL VALORE TIPO
                                                                     // DA UTILIZZARE CON LE API PER LA RICERCA DI UNA SPECIFICA CATEGORIA
        
      },
      

      //-----------------------PARTE GRAFICA RIGUARDANTE LA CATEGORIA-----------------------------//

      child: Stack
      (

        children: <Widget>
        [

              
              Container
              (
                padding: EdgeInsets.all(10),
                
                 child: 
                    Chip(label: Text(nome),labelStyle: TextStyle(color: Theme.of(context).primaryColor,fontFamily: 'Newsreader' ,))
                    
              ),
        ]
      ),

      //-----------------------PARTE GRAFICA RIGUARDANTE LA CATEGORIA-----------------------------//





    ) ;
  }

  
}



class CatMod
{
  String nomecat;                    // UTILIZZATO NEL FILE DATA.DART AI FINI DI IDENTIFICARE NOME E TIPO
  String tipo;
}