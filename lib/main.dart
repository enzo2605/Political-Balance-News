import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'Pagina_caricamento.dart';
import 'package:political_balance_news/ListaTemi.dart';
import 'package:political_balance_news/Utile.dart';
import "Pagina_caricamento.dart";


StreamController<int> st = StreamController<int>.broadcast();
/*void main() 
{

  bool tema_cambiato=false;
  


    //PROVA COMMIT


  runApp((MaterialApp(
    
    title: 'Politic Balance News',
    theme: tema_cambiato ? get_themes(1) : get_themes(0),
    debugShowCheckedModeBanner: false,
    home: Pc(),
  )));
  
}*/
bool cambi=false;
void main() async {
    WidgetsFlutterBinding.ensureInitialized();

  runApp((main_app()));
}

class main_app extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
        initialData: futuro().y,
        stream: st.stream,
        builder: (context, snapshot) {
          /*if(snapshot.data==1)
          {
             print("ciao");
             print(futuro().y);
          }
            else
            {
              st.add(0);
              print(futuro().y);
            }*/
          
          return MaterialApp(
              theme: cambi ? get_themes(snapshot.data) : get_themes(1) ,
              debugShowCheckedModeBanner: false,
              home: Pci(),); // da cambiare con pc (l'ho fatto per non fare tante richieste alle api)
        });
  }
}



  Future<int> _readData() async {
    final _dirPath = await _getDirPath();
    final _myFile = File('$_dirPath/data.txt');
    final _data = await _myFile.readAsString(encoding: utf8);
     return int.parse(_data);
     
  }

    

  Future<String> _getDirPath() async {
    final _dir = await getApplicationDocumentsDirectory();
    return _dir.path;
  }

 


  class futuro 
  {
    int y;
    futuro()
    {
      get_data1();
      
    }
    // ignore: non_constant_identifier_names
    void get_data1() async
    {
       y  = await _readData();
       cambi=true;
       st.add(y);
      print("VALORE Y $y");
    }
  }
  
