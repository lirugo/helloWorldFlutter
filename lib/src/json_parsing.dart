import 'dart:convert';

import 'package:helloWorldFlutter/src/article.dart';

List<int> parseArray(String jsonArray) {
  final parsed = jsonDecode(jsonArray);
  return List<int>.from(parsed);
}

Article parseArticle(String jsonArticle) {
  final parsed = jsonDecode(jsonArticle);
  Article article = Article.fromJson(parsed);

  return article;
}
