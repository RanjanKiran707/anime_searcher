import 'package:anime_search/animePage/animePageGenres.dart';
import 'package:anime_search/animePage/animePageRelated.dart';
import 'package:anime_search/animePage/animePageReviews.dart';
import 'package:anime_search/animePage/animePageSynopsis.dart';
import 'package:anime_search/models/AnimeDetail.dart';
import 'package:anime_search/models/AnimeReview.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class AnimePageExpansions extends StatelessWidget {
  const AnimePageExpansions({
    Key key,
    @required this.anime,
    @required this.reviews,
  }) : super(key: key);

  final AnimeDetail anime;
  final List<Review> reviews;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        AnimePageSynopsis(anime: anime),
        20.heightBox,
        AnimePageReviews(reviews: reviews),
        20.heightBox,
        AnimePageRelated(anime: anime),
        20.heightBox,
        AnimePageGenres(anime: anime),
        29.heightBox,
      ],
    );
  }
}
