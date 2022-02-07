import 'package:anime_search/animeListPage/animeListCard.dart';
import 'package:anime_search/models/AnimeSearchResult.dart';
import 'package:anime_search/theme.dart';
import 'package:flutter/material.dart';

class AnimeList extends StatelessWidget {
  final List<Result> list;

  const AnimeList({Key key, this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themeData.primaryColor,
      appBar: AppBar(
        backgroundColor: themeData.primaryColor,
      ),
      body: Container(
        child: ListView(
          children: list.map((e) => AnimeCard(anime: e)).toList(),
        ),
      ),
    );
  }
}
