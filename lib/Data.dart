import 'package:political_balance_news/Categorie.dart';

List<CatMod> getCat()
{
   List <CatMod> cat = [];
   CatMod catm =new CatMod();

    catm.nomecat = "Generale";
    catm.urlimm = "https://chessdailynews.com/wp-content/uploads/2015/03/general_news5.jpg";
    catm.tipo= "general";

    cat.add(catm);
    catm = new CatMod();





   catm.nomecat = "Business";
   catm.urlimm = "https://www.gianlucapalermi.it/wp-content/uploads/2021/04/business-3152586_960_720.jpg";
   catm.tipo= "business";
   

   cat.add(catm);
   catm = new CatMod();


    catm.nomecat = "Sport";
    catm.urlimm = "https://www.sportesalute.eu/images/articoli/webinar-societa-tesserati.jpg";
    catm.tipo= "sport";

   cat.add(catm);
   catm = new CatMod();


    catm.nomecat = "Salute";
    catm.urlimm = "https://www.assidai.it/wp-content/uploads/2019/05/diritto-salute-italia.jpg";
    catm.tipo= "health";

    cat.add(catm);
    catm = new CatMod();


    catm.nomecat = "Intreattenimento";
    catm.urlimm = "https://www.socialtoaster.com/wp-content/uploads/2020/02/shutterstock_759974710-copy-1080x675.jpg";
    catm.tipo= "entertainment";

    cat.add(catm);
    catm = new CatMod();


    catm.nomecat = "Scienza";
    catm.urlimm = "https://www.ilprimatonazionale.it/wp-content/uploads/2020/04/scienza-coronavirus.jpg";
    catm.tipo= "science";

    cat.add(catm);
    catm = new CatMod();



  catm.nomecat = "Tecnologia";
  catm.urlimm = "https://www.informagiovaniancona.com/wp-content/uploads/2018/10/cosa-serve-tecnologia.png";
  catm.tipo= "technology";

   cat.add(catm);
   catm = new CatMod();

  return cat;


}