import 'package:anime_search/landingPage/LandingGenreItem.dart';
import 'package:anime_search/landingPage/genreList.dart';
import 'package:flutter/material.dart';

class LandingWrap extends StatefulWidget {
  const LandingWrap({
    Key key,
  }) : super(key: key);

  @override
  _LandingWrapState createState() => _LandingWrapState();
}

class _LandingWrapState extends State<LandingWrap> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      runSpacing: 20,
      spacing: 8,
      children: genreList.asMap().entries.map((e) {
        return GenreItem(
          e.value,
          e.key + 1,
        );
      }).toList(),
    );
  }
}
