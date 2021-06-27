// FUNZIONE PER OTTENERE LE CATEGORIE UTILIZZO TIPO PER RAGIONI API DI NEWSAPI E NOME PER FARE UN DISPLAY CON PRIMA LETTERA MAIUSCOLA ED IN ITALIANO


import 'package:political_balance_news/Categorie.dart';

List<CatMod> getCat()                                             // FUNZIONE CHE RITORNA LA LISTA
{
   List <CatMod> cat = [];                                        //DICHIARAZIONI E IN SEGUITO ASSEGNAZIONI
   CatMod catm =new CatMod();                                     //CATMOD E' PRESENTE NEL FILE CATEGORIE.DART

    catm.nomecat = "Generale";                                  
    catm.tipo= "general";

    cat.add(catm);                                                //  AGGIUNGO  CATM ( ALIAS DI CATEGORY MODEL ) IN  CAT ( ALIAS DI CATEGORIE ) 
    catm = new CatMod();                              


   catm.nomecat = "Business";
   catm.tipo= "business";
   

   cat.add(catm);
   catm = new CatMod();


    catm.nomecat = "Sport";
    catm.tipo= "sport";

   cat.add(catm);
   catm = new CatMod();


    catm.nomecat = "Salute";
    catm.tipo= "health";

    cat.add(catm);
    catm = new CatMod();


    catm.nomecat = "Intreattenimento";
    catm.tipo= "entertainment";

    cat.add(catm);
    catm = new CatMod();


    catm.nomecat = "Scienza";
    catm.tipo= "science";

    cat.add(catm);
    catm = new CatMod();



  catm.nomecat = "Tecnologia";
  catm.tipo= "technology";

   cat.add(catm);
   catm = new CatMod();

  return cat;                             // RITORNO LA LISTA


}