
import 'dart:convert';
import 'package:http/http.dart' as http;



class News 
{
  List<ArticleModel> news = [];
  Future <void> getNews(String c,String l,String q,String a) async
  {
    String url;
    var name, source;
    if(c==null){c="general";}
    if(l==null){l="it";}
    if(q!=null){
      print('SONO Q DALL if $q');
    url = "https://newsapi.org/v2/everything?q=$q&language=$l&sortBy=publishedAt&apiKey=7fd0d4f7abc9467eb3b977047b7c8388";
    }
    if(q==null||q==""){
      print ('SONO Q DALL ELSE $q');
     url = "https://newsapi.org/v2/top-headlines?category=$c&country=it&pagesize=100&apiKey=7fd0d4f7abc9467eb3b977047b7c8388";}
    
    print('Sono A $a');
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    print(jsonData['status']);
    if(jsonData['status']== "ok")
    {
      
      jsonData["articles"].forEach((element)
      {
        source = element['source'];
        name = source['name'];
        
        if(element['description']!= null && element['urlToImage']!= null )
        {
          if(a=='0')
          {
            for(int k = 0 ; k < giornali_sx.length ; k ++ )
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
          if(a=='1')
          {
            for(int k = 0 ; k < giornali_centro.length ; k ++ )
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

          if(a=='3')
          {
              for(int k = 0 ; k < giornali_dx.length ; k ++ )
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

          if(a!='3'&&a!='1'&&a!='0')
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
        
    
      });
    }
    
  }
}

var giornali_sx = ['Ilfattoquotidiano.it','Huffingtonpost.it','Ilpost.it','Today.it','La Repubblica','Open.online','Ilmattino.it','Ilgiorno.it','ilmanifesto.it','Fanpage.it'];
var giornali_dx = ['Virgilio.it','ilmeteo.it','Lanazione.it','Tgcom.it','Liberoquotidiano.it','Libero.it','ilgiornale.it','Mediaset.it','Ilrestodelcarlino.it','iltempo.it','secoloditalia.it'];
var giornali_centro = ['ANSA.it','Ilmessaggero.it','Corriere.it','Il Sole 24 Ore','Inews24.it','Adnkronos.com','Tg24.sky.it'];


class ArticleModel
{
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String content;

  ArticleModel({this.author,this.title,this.description,this.url,this.urlToImage,this.content});
}

