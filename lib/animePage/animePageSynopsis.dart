import 'package:anime_search/models/AnimeDetail.dart';
import 'package:anime_search/theme.dart';
import 'package:flutter/material.dart';

class AnimePageSynopsis extends StatelessWidget {
  const AnimePageSynopsis({
    Key key,
    @required this.anime,
  }) : super(key: key);

  final AnimeDetail anime;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: themeData.accentColor,
      child: ExpansionTile(
        title: Text("o"),
        leading: Text(
          "Synopsis",
          style: themeData.textTheme.headline2,
        ),
        trailing: Icon(Icons.expand_more, color: Colors.white),
        childrenPadding: const EdgeInsets.only(bottom: 15),
        children: [
          ListTile(
            title: Text(
              anime.synopsis,
              style: TextStyle(fontSize: 16.0, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
