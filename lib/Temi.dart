import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'ListaTemi.dart';
import 'main.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';



  Future<String> _getDirPath() async {
    final _dir = await getApplicationDocumentsDirectory();
    return _dir.path;
  }




  Future<int> _readData() async {
    final _dirPath = await _getDirPath();
    final _myFile = File('$_dirPath/data.txt');
    final _data = await _myFile.readAsString(encoding: utf8);
    return int.parse(_data);
  }


  


  Future<void> _writeData(String x) async {
    final _dirPath = await _getDirPath();
    
    final _myFile = File('$_dirPath/data.txt');
    await _myFile.writeAsString(x);
    print(_dirPath);
  }

void gest_bool(int i,var x)
{
  x[i]=true;
  for(int k = 0; k < x.length; k++ )
  {
    if(i!=k){
    x[k]=false;
    }
  }
}






class tema extends StatefulWidget {
  

  temi createState() => temi();
  
  
}

class temi extends State<tema> 
{
  final GlobalKey <ScaffoldState> chiave = new GlobalKey<ScaffoldState>();
  
  void initState() { 
   checkValue();
  super.initState();
}
    
    

var check1 = [false,false,false,];
checkValue() async 
    {
      
      final val = await _readData();
      for(int index = 0 ; index < check1.length ; index ++ )
      {
        if (val==index)
        {
          setState(() 
          {
            check1[index]=true;
          });
        }
      }
      
    }




   Widget build(BuildContext) 
   {

     
    
      
     return Scaffold
     (
       
       key: chiave,
       appBar:  AppBar
        (
        backgroundColor: Colors.transparent,
        elevation: 0.0,
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


       backgroundColor: Theme.of(context).primaryColor,

       body: Column
       (

         




        children: <Widget>
        [


           Padding(
                  padding: EdgeInsets.only(left: 15,right: 15,top: 0,bottom: 20),
                  
                  child: Container(
                    margin: EdgeInsets.only(bottom: 1),
                    child: Card(
                        color: Theme.of(context).focusColor,
                        

                        //--------------------- Articolo finto----------------------------//

                        child: Container
                        (
                            padding: EdgeInsets.all(10),
                            
                            child: Column
                            (
                              children: <Widget>
                                [
                                ClipRRect
                                (
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.network("https://media.istockphoto.com/photos/newspaper-front-page-reads-big-news-with-smiling-man-visual-picture-id579766456",width: 200,height: 200,)),
                                Text
                                (
                                  "Incredibile Notizia, cambio di tema !",
                                  style: Theme.of(context).textTheme.headline6
                                ),
                                SizedBox
                                (
                                  height: 8,
                                ),
                                Text
                                (
                                  "Sembra che il nostro utente abbia performato un cambio di tema !",
                                  style: Theme.of(context).textTheme.bodyText2
                                ),
                                  Card(margin: EdgeInsets.only(bottom: 15)),
                              ],
                            )
                            
                        ),


                        //--------------------- Articolo finto----------------------------//
                        
                        
                        ),
                            
                    )
                  )
           ,



  //----------------FINTA CATEGORIA----------------//
  Align(
    alignment: Alignment.bottomLeft,
       child: Stack
      (

        children: <Widget>
        [

              
              Container
              (
                padding: EdgeInsets.only(left: 25,bottom: 25),
                
                 child: 
                    Chip
                    (
                      label: Text("Categoria",style: TextStyle(color: Theme.of(context).primaryColor),),
                      backgroundColor: Theme.of(context).accentColor,
                    ),
                     
              )
          
        ]
      ),),

      //----------------FINTA CATEGORIA----------------//
          



       //LISTA TEMI   
        Align
        (
        alignment: Alignment.bottomCenter,
        
        child: Column
        (

          
          children: <Widget>
          [ 
            //-------------- PRIMO TEMA--------------//
            SwitchListTile
          (
            title: Text("Tema Rosa e Blu",style: Theme.of(context).textTheme.headline4),
            value: check1[0], 
            activeColor: Colors.green.shade400,
            

            onChanged: (bool value)
            {
              
              setState(() {
              check1[0] = value;          // SET PER LO SWITCH
              });

              cambi=true;                 // serve per il main nel tema 
              gest_bool(0, check1);       // sett gli altri switch ad off
              _writeData('0');            // Scrive nel file relativo che indice di tema
              st.add(0);                  // Aggiunge l'indice allo stream del main


              snacks().snack(context);    //SNACKBAR  
              
              


            },
          ),
            //-------------- PRIMO TEMA--------------//


            //-------------- SECONDO TEMA--------------//
          SwitchListTile
          (
            title:  Text("Tema Bianco e Nero",style: Theme.of(context).textTheme.headline4),
            value: check1[1], 
            activeColor: Colors.green.shade400,
            

            onChanged: (bool value)
            {
              
              setState(() {
              check1[1] = value;          // SET PER LO SWITCH
              });


              cambi=true;                 // serve per il main nel tema
              gest_bool(1, check1);       // sett gli altri switch ad off
              _writeData('1');            // Scrive nel file relativo che indice di tema
              st.add(1);                  // Aggiunge l'indice allo stream del main


              snacks().snack(context);    //SNACKBAR


            }),
              //-------------- SECONDO TEMA--------------//


             //-------------- TERZO TEMA--------------//
          SwitchListTile
          (
            title:  Text("Tema Nero e Senape",style: Theme.of(context).textTheme.headline4),
            value: check1[2], 
            activeColor: Colors.green.shade400,

            onChanged: (bool value)
            {
              
              setState(() {
              check1[2] = value;          // SET PER LO SWITCH
              });


              cambi=true;                 // serve per il main nel tema
              gest_bool(2, check1);       // sett gli altri switch ad off
              _writeData('2');            // Scrive nel file relativo che indice di tema
              st.add(2);                  // Aggiunge l'indice allo stream del main


            snacks().snack(context);      //SNACKBAR


            }),

            //-------------- TERZO TEMA--------------//

          





          ],
          )
        )
        ],
       )
     );
   }
}

 
class snacks
{
  
  Widget snack(BuildContext context)
  {
    final snack = SnackBar(
    content: Text("Tema cambiato !"),                               //WIDGET PER FARE IL DISPLAY DELLA SNACK BAR PER IL CAMBIO DI TEMA
    backgroundColor: Colors.black,
    );
    ScaffoldMessenger.of(context).showSnackBar(snack);
            
  }

}