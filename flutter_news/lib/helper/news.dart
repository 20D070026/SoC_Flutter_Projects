import 'dart:convert';
import 'dart:html';
import 'package:flutter_news/models/article_model.dart';
import 'package:http/http.dart' as http;
class News{
  List<ArticleModel> news = [];

  Future<void>getNews() async {


   String url = "https://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=API_KEY";


   http.Response response = await http.get(Uri.https("newsapi.org","/v2/top-headlines?country=in&category=business&apiKey=API_KEY"));

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok"){
      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] =! null ) {
           ArticleModel articleModel = ArticleModel(
              author: element["author"],
              title: element["title"],
              description: element["description"],
              url: element["url"],
              urlToImage: element["urlToImage"],
              content: element["content"]
          );

           news.add(articleModel);
        }
      }
      );

      }
    }




  }
