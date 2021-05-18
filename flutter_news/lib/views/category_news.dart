import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';



class CategoryNews extends StatefulWidget {
  @override
  _CategoryNewsState createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("FlutterNews"),
          centerTitle: true,
          elevation: 0.0,

        ),
        body: Container(
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
        )
    );
  }
}
