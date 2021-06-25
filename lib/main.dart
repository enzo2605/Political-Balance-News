import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'Pagina_caricamento.dart';
import 'package:political_balance_news/ListaTemi.dart';

StreamController<int> st = StreamController<int>.broadcast();

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
          
          return MaterialApp(
              theme: cambi ? get_themes(snapshot.data) : get_themes(1) ,
              debugShowCheckedModeBanner: false,
              home: Pci(),);
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
      
    }
  }
  
