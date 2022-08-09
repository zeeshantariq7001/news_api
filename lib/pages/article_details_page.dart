import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:news_api/model/article_model.dart';

class ArticlePage extends StatelessWidget {
  final Article? article;
  ArticlePage({this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text(
          "${article!.title.toString()}",
          style: TextStyle(
              fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(article!.urlToImage!),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(8.0)),
            ),
            SizedBox(
              height: 8.0,
            ),
            Container(
                padding: EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Text(
                  article!.source!.name.toString(),
                  style: TextStyle(color: Colors.white),
                )),
            SizedBox(
              height: 8,
            ),
            Text(
              article!.description!,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            )
          ],
        ),
      ),
    );
  }
}
