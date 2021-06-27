import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'Pagina_caricamento.dart';
import 'package:political_balance_news/ListaTemi.dart';

StreamController<int> st = StreamController<int>.broadcast();                                 // STREAM PER ELABORARE L'INVIO DEI DATI DA TEMI.DART

bool cambi=false;                                                                             // SE E' LA PRIMA VOLTA CHE SI AVVIA L'APP IL TEMA DI DEFAULT SARA' IL BIANCO E NERO
void main() async {
    WidgetsFlutterBinding.ensureInitialized();

  runApp((main_app()));
}

class main_app extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(                                                                // L'UTILIZZO DI STREAM BUILDER SERVE A RENDERE IL TUTTO SEMPLICE
        initialData: futuro().y,                                                              // INIZIALMENTE IL DATO Y SARA' SEMPRE NULL PERCHE' INIZIALIZZATO PRIMA DEL COSTRUTTORE
        stream: st.stream,                                                                    // STREAM
        builder: (context, snapshot) {
          
          return MaterialApp(
              theme: cambi ? get_themes(snapshot.data) : get_themes(1) ,                        // UTILIZZO DEL BOOL CAMBI  
              debugShowCheckedModeBanner: false,                                                //INOLTRE DATO IL VALORE ARRIVATO  LO UTILIZZA PER IL DISPLAY DEL GIUSTO TEMA
              home: Pci(),                                                                      //PAGINA DI CARICAMENTO CHE REINDIRIZZA AD HOMEPAGE
              );
        });
  }
}



  Future<int> _readData() async {
    final _dirPath = await _getDirPath();
    final _myFile = File('$_dirPath/data.txt');
    final _data = await _myFile.readAsString(encoding: utf8);                               //READ DATA IDENTICO A QUELLO IN TEMI
     return int.parse(_data);
     
  }

    

  Future<String> _getDirPath() async {
    final _dir = await getApplicationDocumentsDirectory();                                   //GETDIR IDENTIDCO A QUELLO IN TEMI
    return _dir.path;
  }

 


  class futuro 
  {
    int y;
    futuro()
    {
      get_data1();                                                                            //COSTRUTTORE PER AVVIARE IMMEDIATAMENTE IL METODO GETDATA1 CHE E' ASINCRONO
                                                                                              //FACCIO COSI' PERCHE' IL COSTRUTTORE NON PUO' ESSERE ASINCRONO
    }
    // ignore: non_constant_identifier_names
    void get_data1() async
    {
       y  = await _readData();                                                                // ASPETTO CHE ARRIVI IL DATO DAL FILE
       cambi=true;                                                                            // SETTO IL CAMBI = TRUE
       st.add(y);                                                                             // LO AGGIUNGO ALLO STRAM IN MODO CHE QUANDO ARRIVA IL DATO CAMBIA IL TEMA
      
    }
  }
  
