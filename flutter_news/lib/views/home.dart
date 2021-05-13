

import 'package:flutter/material.dart';
import 'package:flutter_news/helper/data.dart';
import 'package:flutter_news/helper/news.dart';
import 'package:flutter_news/main.dart';
import 'package:flutter_news/models/article_model.dart';
import 'package:flutter_news/models/category_model.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<CategoryModel> getCategory = [];
  List<ArticleModel> articles = [];
  bool _loading = true;


  @override
  void initState() {
    super.initState();
  }

  getNews() async {
    News newsClass = News();
    await newsClass.getNews();
    articles = newsClass.news;
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
      ) : Container(

        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              height: 70,
              child: ListView.builder(
                itemCount: getCategory.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index){
                  return CategoryTile(
                    imageUrl: getCategory[index].imageUrl,
                    categoryName: getCategory[index].categoryName,
                  );
                  },
              ),
            ),

            Container(
              child: ListView.builder(
                itemCount: articles.length,
                shrinkWrap: true,
                itemBuilder: (context, index){
                  return BlogTile(
                    title: articles[index].title,
                    imageUrl: articles[index].urlToImage,
                    desc: articles[index].description
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {

  final imageUrl, categoryName;
  CategoryTile({this.imageUrl, this.categoryName});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.only(
          right: 16
        ),
        child: Stack(
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.circular(5) ,
                child: Image.network(imageUrl, width: 140, height: 80, fit: BoxFit.cover,)),
            Container(
              alignment: Alignment.center,
              width: 140, height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5) ,
                color: Colors.black26
              ),
              child: Text(categoryName, style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,



              ),
              ),
            )

          ],
        ),
      ),
    );
  }
}

class BlogTile extends StatelessWidget {
  final String imageUrl, title, desc;

  BlogTile({@required this.imageUrl, @required this.title, @required this.desc});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Image.network(imageUrl),
          Text(title),
          Text(desc),
        ],

      ),
    );
  }
}


