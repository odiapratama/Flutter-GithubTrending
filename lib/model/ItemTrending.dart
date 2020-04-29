import 'package:githubtrending/model/BuiltBy.dart';

class Trending {
  final List<ItemTrending> listTrending;

  Trending({this.listTrending});

  factory Trending.fromJson(dynamic json) {
    return Trending(
      listTrending: json != null ? (json as List).map((i) => ItemTrending.fromJson(i)).toList() : null,
    );
  }

  List<dynamic> toJson() {
    List<dynamic> data = new List<ItemTrending>();
    if (this.listTrending != null) {
      data = this.listTrending;
    }
    return data;
  }
}

class ItemTrending {
  String author;
  String avatar;
  List<BuiltBy> builtBy;
  int currentPeriodStars;
  String description;
  int forks;
  String language;
  String languageColor;
  String name;
  int stars;
  String url;

  ItemTrending(
      {this.author,
      this.avatar,
      this.builtBy,
      this.currentPeriodStars,
      this.description,
      this.forks,
      this.language,
      this.languageColor,
      this.name,
      this.stars,
      this.url});

  factory ItemTrending.fromJson(Map<String, dynamic> json) {
    return ItemTrending(
      author: json['author'],
      avatar: json['avatar'],
      builtBy: json['builtBy'] != null
          ? (json['builtBy'] as List).map((i) => BuiltBy.fromJson(i)).toList()
          : null,
      currentPeriodStars: json['currentPeriodStars'],
      description: json['description'],
      forks: json['forks'],
      language: json['language'],
      languageColor: json['languageColor'],
      name: json['name'],
      stars: json['stars'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['author'] = this.author;
    data['avatar'] = this.avatar;
    data['currentPeriodStars'] = this.currentPeriodStars;
    data['description'] = this.description;
    data['forks'] = this.forks;
    data['language'] = this.language;
    data['languageColor'] = this.languageColor;
    data['name'] = this.name;
    data['stars'] = this.stars;
    data['url'] = this.url;
    if (this.builtBy != null) {
      data['builtBy'] = this.builtBy.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
