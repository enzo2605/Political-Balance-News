//FILE CHE PERMETTE IL FETCH GRAZIE ALL'API
import 'dart:convert';
import 'package:http/http.dart' as http;


class News 
{
  List<ArticleModel> news = [];
  Future <void> getNews(String c,String l,String q,String a) async      // VARIE VARIABILI UTILI NEL QUALORA ARRIVANO VALORI DA STREAM  C = CATEGORIA, L = LINGUAGGIO 
  {                                                                     // Q = TITOLO, A = QUALE ALA POLITICA E' STATA SELEZIONATA
    String url;
    var name, source;
    if(c==null){c="general";}                                           //SET DI DEFAULT PER SE ANCORA NON SI E' SCELTA UNA CATEGORIA/LINGUA/TITOLO
    if(l==null){l="it";}                                                
    if(q!=null){
    url = "https://newsapi.org/v2/everything?q=$q&language=$l&sortBy=publishedAt&apiKey=b7cdbe8abcc0401bb2a2fc2f1dd84c1d";      //RICHIESTA API CON PAROLA PRESENTE IN ARTICOLO E LINGUAGGIO SCELTO
    }
    if(q==null||q==""){
     url = "https://newsapi.org/v2/top-headlines?category=$c&country=it&pagesize=100&apiKey=b7cdbe8abcc0401bb2a2fc2f1dd84c1d";} //RICHIESTA API DI DEFAULT OPPURE SE SI E' SELEZIONATA CATEGORIA 
    
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);                           // FETCH DI DATI
    
    if(jsonData['status']== "ok")                                       // SE HO ANCORA RICHIESTE DA POTER EFFETTUARE
    {
      
      jsonData["articles"].forEach((element)                            // PER OGNI ELEMENTO DI ARTICLES (SEGUO LA DOCUMENTAZIONE DI NEWSAPI.ORG)
      {
        source = element['source'];                                     // PER POTER ACCEDERE ALL'ARRAY SOURCE DELL'API
        name = source['name'];                                          // IN PARTICOLARE ALLA VARIABILE NAME PER POTER CATEGORIZZARE IL GIORNALI A SECONDA
                                                                        // DELLO SPETTRO POLITICO
        
        if(element['description']!= null && element['urlToImage']!= null )  // NON RITORNA ARTICOLI CHE NON HANNO DESCRIZIONE E IMMAGINE
        {
          if(a=='0')                                                        // SE A E' ZERO VUOL DIRE CHE IL TOGGLESWITCH DI HOMEPAGE E' SELEZIONATO SU SINISTRA
          {
            for(int k = 0 ; k < giornali_sx.length ; k ++ )                 // SE IL GIORNALE E' PRESENTE IN NEL MIO ARRAY GIORNALI_SX ALLORA LO AGGIUNGE NEL MODELLO DELL'ARTICOLO
              {

                if(name==giornali_sx[k])
                {
                  ArticleModel articleModel = ArticleModel(
                  
                  title: element["title"],
                  author: element["author"],
                  description: element["description"],
                  url: element["url"],
                  urlToImage: element["urlToImage"],
                  content: element["context"],);
                  news.add(articleModel);
                  }
              }
          }
          if(a=='1')                                                        // SE A E' 1 VUOL DIRE CHE IL TOGGLESWITCH DI HOMEPAGE E' SELEZIONATO SU CENTRO
          {
            for(int k = 0 ; k < giornali_centro.length ; k ++ )             // SE IL GIORNALE E' PRESENTE IN NEL MIO ARRAY GIORNALI_CENTRO ALLORA LO AGGIUNGE NEL MODELLO DELL'ARTICOLO
              {

                if(name==giornali_centro[k])
                {
                  ArticleModel articleModel = ArticleModel(
                  
                  title: element["title"],
                  author: element["author"],
                  description: element["description"],
                  url: element["url"],
                  urlToImage: element["urlToImage"],
                  content: element["context"],);
                  news.add(articleModel);
                  }
              }
          }

          if(a=='3')                                                    // SE A E' 3 VUOL DIRE CHE IL TOGGLESWITCH DI HOMEPAGE E' SELEZIONATO SU DESTRA    
          {
              for(int k = 0 ; k < giornali_dx.length ; k ++ )           // SE IL GIORNALE E' PRESENTE IN NEL MIO ARRAY GIORNALI_DX ALLORA LO AGGIUNGE NEL MODELLO DELL'ARTICOLO
              {

                if(name==giornali_dx[k])
                {
                  ArticleModel articleModel = ArticleModel(
                  
                  title: element["title"],
                  author: element["author"],
                  description: element["description"],
                  url: element["url"],
                  urlToImage: element["urlToImage"],
                  content: element["context"],);
                  news.add(articleModel);
                  }
              }
            
          }

          if(a!='3'&&a!='1'&&a!='0')                              // SE A E' UN ALTRO VALORE O NULL VUOL DIRE CHE IL TOGGLESWITCH DI HOMEPAGE E' SELEZIONATO SU TUTTO
          {
            
              ArticleModel articleModel = ArticleModel(         // RITORNA QUALSIASI ARTICOLO SENZA INDESCRIZIONI
            
              title: element["title"],
              author: element["author"],
              description: element["description"],
              url: element["url"],
              urlToImage: element["urlToImage"],
              content: element["context"],);
              news.add(articleModel);
          }
          
        }
        
    
      });
    }
    
  }
}

// LA MIA LISTA PERSONALE DI GIORNALI
var giornali_sx = ['Ilfattoquotidiano.it','Huffingtonpost.it','Ilpost.it','Today.it','La Repubblica','Open.online','Ilmattino.it','Ilgiorno.it','ilmanifesto.it','Fanpage.it'];
var giornali_dx = ['Virgilio.it','ilmeteo.it','Lanazione.it','Tgcom.it','Liberoquotidiano.it','Libero.it','ilgiornale.it','Mediaset.it','Ilrestodelcarlino.it','iltempo.it','secoloditalia.it','Quotidiano.net'];
var giornali_centro = ['ANSA.it','Ilmessaggero.it','Corriere.it','Il Sole 24 Ore','Inews24.it','Adnkronos.com','Tg24.sky.it','Rainews.it','Lastampa.it'];


class ArticleModel
{
  String author;
  String title;
  String description;
  String url;                                                       // MODELLO PER RAGGRUPPARE LE INFORMAZIONI PRINCIPALI DI CIASCUN ARTICOLO
  String urlToImage;
  String content;

  ArticleModel({this.author,this.title,this.description,this.url,this.urlToImage,this.content});
}

