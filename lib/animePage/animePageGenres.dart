import 'package:anime_search/models/AnimeDetail.dart';
import 'package:anime_search/theme.dart';
import 'package:flutter/material.dart';

class AnimePageGenres extends StatelessWidget {
  final AnimeDetail anime;

  const AnimePageGenres({Key key, this.anime}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String genreString = "";
    anime.genres.forEach((element) {
      genreString += element.name + "  ";
    });
    return Container(
      color: themeData.accentColor,
      child: ExpansionTile(
        title: Text("o"),
        leading: Text(
          "Genres",
          style: themeData.textTheme.headline2,
        ),
        trailing: Icon(Icons.expand_more, color: Colors.white),
        childrenPadding: const EdgeInsets.only(bottom: 15),
        children: [
          ListTile(
            title: Text(
              genreString,
              style: TextStyle(fontSize: 16.0, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
