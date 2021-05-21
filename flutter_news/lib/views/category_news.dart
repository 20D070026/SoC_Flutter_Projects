import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:newsapi/newsapi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news/helper/data.dart';
import 'package:flutter_news/helper/news.dart';
import 'package:flutter_news/main.dart';

import 'package:flutter_news/models/category_model.dart';
import 'package:flutter_news/views/article_view.dart';
import 'package:newsapi/newsapi.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:convert';
import 'dart:async';

import 'package:flutter_news/views/category_news.dart';
import 'package:http/http.dart' as http;
import 'package:newsapi/newsapi.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'home.dart';



class CategoryNews extends StatefulWidget {

  final String category;
  CategoryNews({this.category});
  @override
  _CategoryNewsState createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {

  List<Article> articles = [];
  bool _loading = true;

  @override
  void initState() {
    getCategoryNews();

    super.initState();
  }

  Future<void> getCategoryNews() async {
    CategoryNewsClass newsClass = CategoryNewsClass(category: widget.category);
    await newsClass.getCategoryNews();
    articles = newsClass.articles;
    setState(() {
      _loading = false;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("FlutterNews"),
          centerTitle: true,
          elevation: 0.0,

        ),
        body: _loading ? Center(
          child: Container(
            child: CircularProgressIndicator(),
          ),
        ) : SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                child: ListView.builder(
                  itemCount: articles.length,
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return BlogTile(
                        title: articles[index].title,
                        imageUrl: articles[index].urlToImage,
                        desc: articles[index].description,
                        url: articles[index].url
                    );
                  },
            ),
                ),
              ],
            )
          ),
        )
    );
  }
}
