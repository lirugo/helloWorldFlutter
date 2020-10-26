import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'serializers.dart';

part 'json_parsing.g.dart';

abstract class Article implements Built<Article, ArticleBuilder> {
  static Serializer<Article> get serializer => _$articleSerializer;

  int get id;

  @nullable
  int get score;

  @nullable
  int get descendants;

  @nullable
  String get title;

  @nullable
  String get type;

  @nullable
  String get by;

  @nullable
  BuiltList<int> get kids;

  Article._();

  factory Article([void Function(ArticleBuilder) updates]) = _$Article;
}

List<int> parseArray(String jsonArray) {
  return [];
}

Article parseArticle(String jsonArticle) {
  return standardSerializers.deserializeWith(
      Article.serializer, jsonDecode(jsonArticle));
}
