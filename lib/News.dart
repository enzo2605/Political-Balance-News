
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
            if(name==giornali_sx[0]||name==giornali_sx[1]||name==giornali_sx[2]||name==giornali_sx[3])
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
          if(a=='1')
          {
            if(name==giornali_centro[0]||name==giornali_centro[1]||name==giornali_centro[2]||name==giornali_centro[3]||name==giornali_centro[4]||name==giornali_centro[5]||name==giornali_centro[6]||name==giornali_centro[7])
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

          if(a=='3')
          {
            if(name==giornali_dx[0]||name==giornali_dx[1]||name==giornali_dx[2]||name==giornali_dx[3]||name==giornali_dx[4]||name==giornali_dx[5]||name==giornali_dx[6])
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

          if(a!='3'&&a!='1'&&a!='0')
          {
            print('A PER LA SECONDA VOLTA $a');
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

var giornali_sx = ['Ilfattoquotidiano.it','Huffingtonpost.it','Ilpost.it','Today.it'];
var giornali_dx = ['Virgilio.it','ilmeteo.it','Lanazione.it','Tgcom.it','Liberoquotidiano.it','Libero.it','ilgiornale.it'];
var giornali_centro = ['ANSA.it','Ilmessaggero.it','Corriere.it','Il Sole 24 Ore','Inews24.it','Adnkronos.com','Tg24.sky.it','Ilrestodelcarlino.it'];


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