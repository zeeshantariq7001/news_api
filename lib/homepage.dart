// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:news_api/componenets/customListTile.dart';
import 'package:news_api/services/api_services.dart';

import 'model/article_model.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  ApiServices client = ApiServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text(
          "News App",
          style: TextStyle(
              fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
        builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
          if (snapshot.hasData) {
            List<Article>? articles = snapshot.data;
            return ListView.builder(
              itemCount: articles!.length,
              itemBuilder: (BuildContext context, int index) {
                return customListTile(articles[index], context);
              },
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
        future: client.getArticle(),
      ),
    );
  }
}
