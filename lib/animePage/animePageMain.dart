import 'package:anime_search/animePage/animePageExpansions.dart';
import 'package:anime_search/models/AnimeDetail.dart';
import 'package:anime_search/models/AnimeReview.dart';
import 'package:anime_search/theme.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:velocity_x/velocity_x.dart';

class AnimePage extends StatelessWidget {
  final AnimeDetail anime;
  final List<Review> reviews;

  const AnimePage({Key key, this.anime, this.reviews}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themeData.primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: SizedBox.expand(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Hero(
                  tag: anime.malId,
                  child: CachedNetworkImage(imageUrl: anime.imageUrl),
                ),
                20.heightBox,
                Text(
                  anime.title,
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),
                10.heightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    anime.type.toString().text.color(Colors.white).xl.make(),
                    20.widthBox,
                    anime.aired.from.toString().substring(0, 4).text.color(Colors.white).xl.make(),
                    20.widthBox,
                    anime.score.toString().text.white.xl.make(),
                    20.widthBox,
                    Icon(
                      Icons.person,
                      size: 25,
                      color: Vx.white,
                    ),
                    formatter.format(anime.members).text.white.xl.make(),
                  ],
                ),
                10.heightBox,
                Expanded(
                  child: AnimePageExpansions(anime: anime, reviews: reviews),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

var formatter = NumberFormat('##,##,##,000');
