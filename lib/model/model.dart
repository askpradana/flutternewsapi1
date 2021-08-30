class NewsModel {
  String? status;
  int? totalResults;
  List<Articles>? articles;

  NewsModel({this.status, this.totalResults, this.articles});

  NewsModel.fromJson(Map<String, dynamic> json) {
    if (json["status"] is String) this.status = json["status"];
    if (json["totalResults"] is int) this.totalResults = json["totalResults"];
    if (json["articles"] is List)
      this.articles = json["articles"] == null
          ? null
          : (json["articles"] as List)
              .map((e) => Articles.fromJson(e))
              .toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["status"] = this.status;
    data["totalResults"] = this.totalResults;
    if (this.articles != null)
      data["articles"] = this.articles?.map((e) => e.toJson()).toList();
    return data;
  }
}

class Articles {
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  Articles(
      {this.source,
      this.author,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.publishedAt,
      this.content});

  Articles.fromJson(Map<String, dynamic> json) {
    if (json["source"] is Map)
      this.source =
          json["source"] == null ? null : Source.fromJson(json["source"]);
    if (json["author"] is String) this.author = json["author"];
    if (json["title"] is String) this.title = json["title"];
    if (json["description"] is String) this.description = json["description"];
    if (json["url"] is String) this.url = json["url"];
    if (json["urlToImage"] is String) this.urlToImage = json["urlToImage"];
    if (json["publishedAt"] is String) this.publishedAt = json["publishedAt"];
    if (json["content"] is String) this.content = json["content"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.source != null) data["source"] = this.source?.toJson();
    data["author"] = this.author;
    data["title"] = this.title;
    data["description"] = this.description;
    data["url"] = this.url;
    data["urlToImage"] = this.urlToImage;
    data["publishedAt"] = this.publishedAt;
    data["content"] = this.content;
    return data;
  }
}

class Source {
  String? id;
  String? name;

  Source({this.id, this.name});

  Source.fromJson(Map<String, dynamic> json) {
    if (json["id"] is String) this.id = json["id"];
    if (json["name"] is String) this.name = json["name"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["name"] = this.name;
    return data;
  }
}
