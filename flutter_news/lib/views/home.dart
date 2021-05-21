

import 'package:flutter/material.dart';
import 'package:flutter_news/helper/data.dart';
import 'package:flutter_news/helper/news.dart';
import 'package:flutter_news/main.dart';

import 'package:flutter_news/models/category_model.dart';
import 'package:flutter_news/views/article_view.dart';
import 'package:flutter_news/views/category_news.dart';
import 'package:newsapi/newsapi.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
 List<Article> articles = [];
  List<CategoryModel> categories = [];
  
  bool _loading = true;


  Future<void> getNews() async {
    News newsClass = News();
    await newsClass.getNews();
    articles = newsClass.articles;
    setState(() {
      _loading = false;
    });
   
  }


  @override
  void initState() {
    categories = getCategory();
  
    getNews();
    
    super.initState();
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
          padding: EdgeInsets.symmetric(horizontal: 16),


        child: Column(
          children: <Widget>[
            Container(
              
              height: 70,
              child: ListView.builder(
                itemCount: categories.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index){
                  return CategoryTile(
                    imageUrl: categories[index].imageUrl,
                    categoryName: categories[index].categoryName,
                  );
                  },
              ),
            ),

            Container(
              child: ListView.builder(
                itemCount: articles.length,
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemBuilder: (context, index){
                  return BlogTile(
                    title: articles[index].title,
                    imageUrl: articles[index].urlToImage,
                    desc: articles[index].description,
                    url: articles[index].url
                  );
                },
              ),
            )
          ],
        ),
      ),
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {

  final String imageUrl, categoryName;
  CategoryTile({this.imageUrl, this.categoryName});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => CategoryNews(
            category: categoryName.toLowerCase(),
          )
        ));
      },
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
  final String imageUrl, title, desc, url;

  BlogTile({@required this.imageUrl, @required this.title, @required this.desc, @required this.url});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => ArticleView(

          )
        ));
      },
      child: Container(
        padding: EdgeInsets.only(top: 20),
        child: Column(
          children: <Widget>[
             ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.network(imageUrl)),
            
            Text(title, style: TextStyle(
              fontSize:20,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            )
            ),
            Text(desc, style: TextStyle(
              fontSize: 14,
              color: Colors.black54,
              fontWeight: FontWeight.normal,
            ),
            ),
          ],

        ),
      ),
    );
  }
}


