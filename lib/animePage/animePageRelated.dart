import 'package:anime_search/models/AnimeDetail.dart';
import 'package:anime_search/theme.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class AnimePageRelated extends StatelessWidget {
  final AnimeDetail anime;

  const AnimePageRelated({Key key, this.anime}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: themeData.accentColor,
      child: ExpansionTile(
        title: Text("o"),
        leading: Text(
          "Related Anime",
          style: themeData.textTheme.headline2,
        ),
        trailing: Icon(Icons.expand_more, color: Colors.white),
        children: [
          Column(
            children: [
              anime.related.adaptation == null ? Container() : RelatedSubs(list: anime.related.adaptation, name: "Adaptation"),
              anime.related.summary == null ? Container() : RelatedSubs(list: anime.related.summary, name: "Summary"),
              anime.related.sideStory == null ? Container() : RelatedSubs(list: anime.related.sideStory, name: "SideStory"),
              anime.related.sequel == null ? Container() : RelatedSubs(list: anime.related.sequel, name: "Sequel"),
              anime.related.prequel == null ? Container() : RelatedSubs(list: anime.related.prequel, name: "Prequel"),
              anime.related.other == null ? Container() : RelatedSubs(list: anime.related.other, name: "Other"),
            ],
          ),
        ],
      ),
    );
  }
}

class RelatedSubs extends StatelessWidget {
  final List<Genre> list;
  final String name;

  const RelatedSubs({Key key, this.list, this.name}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(title: name.text.size(15).bold.white.make()),
        Column(
          children: list.map((e) => ListTile(title: e.name.text.size(14).white.make())).toList(),
        ),
      ],
    );
  }
}
