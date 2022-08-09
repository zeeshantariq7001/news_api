import 'dart:convert';

import 'package:http/http.dart';
import 'package:news_api/model/article_model.dart';

class ApiServices {
  final endPointUrl = Uri.parse(
      "https://newsapi.org/v2/everything?q=tesla&from=2022-06-27&sortBy=publishedAt&apiKey=e73aadb81dae44cb8a3c3eb866290c56");

  Future<List<Article>> getArticle() async {
    Response response = await get(endPointUrl);
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      List<dynamic> body = json['articles'];
      List<Article> articles =
          body.map((dynamic item) => Article.fronJaon(item)).toList();
      return articles;
    } else {
      throw ("cant get article");
    }
  }
}
