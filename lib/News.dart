
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;



class News 
{
  List<ArticleModel> news = [];
  Future <void> getNews(String c,String l,String q) async
  {
    String url;
    if(c==null){c="general";}
    if(l==null){l="it";}
    if(q!=null)
    url = "https://newsapi.org/v2/everything?q=$q&language=$l&from=2021-05-04&sortBy=publishedAt&apiKey=b7cdbe8abcc0401bb2a2fc2f1dd84c1d";

    else
     url = "https://newsapi.org/v2/top-headlines?category=$c&country=it&pagesize=100&apiKey=b7cdbe8abcc0401bb2a2fc2f1dd84c1d";
    
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    if(jsonData['status']== "ok")
    {
      
      jsonData["articles"].forEach((element)
      {
        if(element['description']!= null && element['urlToImage']!= null)
        {
          ArticleModel articleModel = ArticleModel(
          
            title: element["title"],
            author: element["author"],
            description: element["description"],
            url: element["url"],
            urlToImage: element["urlToImage"],
            content: element["context"],
            
          );
          
          news.add(articleModel);
          
        }
        
    
      });
    }
    
  }
}







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