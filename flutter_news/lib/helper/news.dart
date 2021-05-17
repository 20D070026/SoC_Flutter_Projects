import 'dart:convert';
import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:newsapi/newsapi.dart';
class News{
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
//    country: country,
//    category: category,
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








