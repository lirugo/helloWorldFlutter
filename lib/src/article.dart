class Article {
  final int id;
  final int score;
  final int descendants;
  final String title;
  final String type;
  final String by;

  Article(this.id, this.score, this.descendants, this.title, this.type, this.by);

  factory Article.fromJson(Map<String, dynamic> json){
    if(json == null) return null;

    return Article(json["id"], json["score"], json["descendants"], json["title"], json["type"], json["by"]);
  }
}