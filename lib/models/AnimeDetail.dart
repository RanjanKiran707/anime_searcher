// To parse this JSON data, do
//
//     final animeDetail = animeDetailFromJson(jsonString);

import 'dart:convert';

class AnimeDetail {
  AnimeDetail({
    this.requestHash,
    this.requestCached,
    this.requestCacheExpiry,
    this.malId,
    this.url,
    this.imageUrl,
    this.trailerUrl,
    this.title,
    this.titleEnglish,
    this.titleJapanese,
    this.titleSynonyms,
    this.type,
    this.source,
    this.episodes,
    this.status,
    this.airing,
    this.aired,
    this.duration,
    this.rating,
    this.score,
    this.scoredBy,
    this.rank,
    this.popularity,
    this.members,
    this.favorites,
    this.synopsis,
    this.background,
    this.premiered,
    this.broadcast,
    this.related,
    this.producers,
    this.licensors,
    this.studios,
    this.genres,
    this.openingThemes,
    this.endingThemes,
  });

  String requestHash;
  bool requestCached;
  int requestCacheExpiry;
  int malId;
  String url;
  String imageUrl;
  String trailerUrl;
  String title;
  String titleEnglish;
  String titleJapanese;
  List<dynamic> titleSynonyms;
  String type;
  String source;
  int episodes;
  String status;
  bool airing;
  Aired aired;
  String duration;
  String rating;
  double score;
  int scoredBy;
  int rank;
  int popularity;
  int members;
  int favorites;
  String synopsis;
  dynamic background;
  String premiered;
  String broadcast;
  Related related;
  List<Genre> producers;
  List<Genre> licensors;
  List<Genre> studios;
  List<Genre> genres;
  List<String> openingThemes;
  List<String> endingThemes;

  factory AnimeDetail.fromRawJson(String str) => AnimeDetail.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AnimeDetail.fromJson(Map<String, dynamic> json) => AnimeDetail(
        requestHash: json["request_hash"],
        requestCached: json["request_cached"],
        requestCacheExpiry: json["request_cache_expiry"],
        malId: json["mal_id"],
        url: json["url"],
        imageUrl: json["image_url"],
        trailerUrl: json["trailer_url"],
        title: json["title"],
        titleEnglish: json["title_english"],
        titleJapanese: json["title_japanese"],
        titleSynonyms: List<dynamic>.from(json["title_synonyms"].map((x) => x)),
        type: json["type"],
        source: json["source"],
        episodes: json["episodes"],
        status: json["status"],
        airing: json["airing"],
        aired: Aired.fromJson(json["aired"]),
        duration: json["duration"],
        rating: json["rating"],
        score: json["score"].toDouble(),
        scoredBy: json["scored_by"],
        rank: json["rank"],
        popularity: json["popularity"],
        members: json["members"],
        favorites: json["favorites"],
        synopsis: json["synopsis"],
        background: json["background"],
        premiered: json["premiered"],
        broadcast: json["broadcast"],
        related: Related.fromJson(json["related"]),
        producers: List<Genre>.from(json["producers"].map((x) => Genre.fromJson(x))),
        licensors: List<Genre>.from(json["licensors"].map((x) => Genre.fromJson(x))),
        studios: List<Genre>.from(json["studios"].map((x) => Genre.fromJson(x))),
        genres: List<Genre>.from(json["genres"].map((x) => Genre.fromJson(x))),
        openingThemes: List<String>.from(json["opening_themes"].map((x) => x)),
        endingThemes: List<String>.from(json["ending_themes"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "request_hash": requestHash,
        "request_cached": requestCached,
        "request_cache_expiry": requestCacheExpiry,
        "mal_id": malId,
        "url": url,
        "image_url": imageUrl,
        "trailer_url": trailerUrl,
        "title": title,
        "title_english": titleEnglish,
        "title_japanese": titleJapanese,
        "title_synonyms": List<dynamic>.from(titleSynonyms.map((x) => x)),
        "type": type,
        "source": source,
        "episodes": episodes,
        "status": status,
        "airing": airing,
        "aired": aired.toJson(),
        "duration": duration,
        "rating": rating,
        "score": score,
        "scored_by": scoredBy,
        "rank": rank,
        "popularity": popularity,
        "members": members,
        "favorites": favorites,
        "synopsis": synopsis,
        "background": background,
        "premiered": premiered,
        "broadcast": broadcast,
        "related": related.toJson(),
        "producers": List<dynamic>.from(producers.map((x) => x.toJson())),
        "licensors": List<dynamic>.from(licensors.map((x) => x.toJson())),
        "studios": List<dynamic>.from(studios.map((x) => x.toJson())),
        "genres": List<dynamic>.from(genres.map((x) => x.toJson())),
        "opening_themes": List<dynamic>.from(openingThemes.map((x) => x)),
        "ending_themes": List<dynamic>.from(endingThemes.map((x) => x)),
      };
}

class Aired {
  Aired({
    this.from,
    this.to,
    this.prop,
    this.string,
  });

  DateTime from;
  DateTime to;
  Prop prop;
  String string;

  factory Aired.fromRawJson(String str) => Aired.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Aired.fromJson(Map<String, dynamic> json) => Aired(
        from: DateTime.parse(json["from"]),
        to: DateTime.parse(json["to"]),
        prop: Prop.fromJson(json["prop"]),
        string: json["string"],
      );

  Map<String, dynamic> toJson() => {
        "from": from.toIso8601String(),
        "to": to.toIso8601String(),
        "prop": prop.toJson(),
        "string": string,
      };
}

class Prop {
  Prop({
    this.from,
    this.to,
  });

  From from;
  From to;

  factory Prop.fromRawJson(String str) => Prop.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Prop.fromJson(Map<String, dynamic> json) => Prop(
        from: From.fromJson(json["from"]),
        to: From.fromJson(json["to"]),
      );

  Map<String, dynamic> toJson() => {
        "from": from.toJson(),
        "to": to.toJson(),
      };
}

class From {
  From({
    this.day,
    this.month,
    this.year,
  });

  int day;
  int month;
  int year;

  factory From.fromRawJson(String str) => From.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory From.fromJson(Map<String, dynamic> json) => From(
        day: json["day"],
        month: json["month"],
        year: json["year"],
      );

  Map<String, dynamic> toJson() => {
        "day": day,
        "month": month,
        "year": year,
      };
}

class Genre {
  Genre({
    this.malId,
    this.type,
    this.name,
    this.url,
  });

  int malId;
  Type type;
  String name;
  String url;

  factory Genre.fromRawJson(String str) => Genre.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Genre.fromJson(Map<String, dynamic> json) => Genre(
        malId: json["mal_id"],
        type: typeValues.map[json["type"]],
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "mal_id": malId,
        "type": typeValues.reverse[type],
        "name": name,
        "url": url,
      };
}

enum Type { ANIME, MANGA }

final typeValues = EnumValues({"anime": Type.ANIME, "manga": Type.MANGA});

class Related {
  Related({
    this.adaptation,
    this.sideStory,
    this.summary,
    this.prequel,
    this.other,
    this.sequel,
  });

  List<Genre> adaptation;
  List<Genre> sideStory;
  List<Genre> summary;
  List<Genre> prequel;
  List<Genre> sequel;
  List<Genre> other;

  factory Related.fromRawJson(String str) => Related.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Related.fromJson(Map<String, dynamic> json) => Related(
        adaptation: json["Adaptation"] == null ? null : List<Genre>.from(json["Adaptation"].map((x) => Genre.fromJson(x))),
        sideStory: json["Side story"] == null ? null : List<Genre>.from(json["Side story"].map((x) => Genre.fromJson(x))),
        summary: json["Summary"] == null ? null : List<Genre>.from(json["Summary"].map((x) => Genre.fromJson(x))),
        prequel: json["Prequel"] == null ? null : List<Genre>.from(json["Prequel"].map((x) => Genre.fromJson(x))),
        other: json["Other"] == null ? null : List<Genre>.from(json["Other"].map((x) => Genre.fromJson(x))),
        sequel: json["Sequel"] == null ? null : List<Genre>.from(json["Sequel"].map((x) => Genre.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Adaptation": List<dynamic>.from(adaptation.map((x) => x.toJson())),
        "Side story": List<dynamic>.from(sideStory.map((x) => x.toJson())),
        "Summary": List<dynamic>.from(summary.map((x) => x.toJson())),
        "Prequel": List<dynamic>.from(prequel.map((x) => x.toJson())),
        "Other": List<dynamic>.from(other.map((x) => x.toJson())),
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
