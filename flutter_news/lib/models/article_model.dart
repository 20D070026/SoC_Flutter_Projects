import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class ArticleModel{

  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String content;

  ArticleModel({this.author, this.title, this.description, this.url, this.urlToImage, this.content});
}

