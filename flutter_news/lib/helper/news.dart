import 'dart:convert';
import 'dart:async';

import 'package:flutter_news/views/category_news.dart';
import 'package:http/http.dart' as http;
import 'package:newsapi/newsapi.dart';
import 'package:webview_flutter/webview_flutter.dart';



class News {
  List<Article> articles = [];

  Future<void> getNews() async {
    var newsApi = NewsApi(
      //  dioOptions: dioOptions,
      //  interceptors: interceptors,
      debugLog: true,
      apiKey: 'foo',
    );

    newsApi.apiKey = 'adf6ce258ced48bbb000ad80d8fea116';

    var topHeadlines = await newsApi.topHeadlines(
// country: country,
   category: 'business',
//    sources: sources,
//    q: q,
      language: 'en',
//    pageSize: pageSize,
//    page: page,
    );

    // ArticleResponse
    articles = topHeadlines.articles;
    print(topHeadlines.articles[0].description);
  }
}


  class CategoryNewsClass {

    List<Article> articles = [];
    Future<void> getCategoryNews() async {
      var newsApi = NewsApi(
        //  dioOptions: dioOptions,
        //  interceptors: interceptors,
        debugLog: true,
        apiKey: 'foo',
      );

      newsApi.apiKey = 'adf6ce258ced48bbb000ad80d8fea116';

      var topHeadlines = await newsApi.topHeadlines(

      category: 'business', 
//    country: country,
      
      
//    sources: sources,
//    q: q,
        language: 'en',
//    pageSize: pageSize,
//    page: page,
      );

      // ArticleResponse
      articles = topHeadlines.articles;
      print(topHeadlines.articles[0].description);

      }
  }









