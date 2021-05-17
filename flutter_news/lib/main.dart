import 'package:flutter/material.dart';
import 'package:flutter_news/main.dart';
import 'package:newsapi/newsapi.dart';
import 'views/home.dart';



void main() {
  runApp(MyApp(

  ));
}

class MyApp extends StatelessWidget{
  //this widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NewsBazaar',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: Home(),
    );
  }
}