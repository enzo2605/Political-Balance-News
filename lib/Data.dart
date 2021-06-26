import 'package:political_balance_news/Categorie.dart';

List<CatMod> getCat()
{
   List <CatMod> cat = [];
   CatMod catm =new CatMod();

    catm.nomecat = "Generale";
    catm.tipo= "general";

    cat.add(catm);
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

  return cat;


}