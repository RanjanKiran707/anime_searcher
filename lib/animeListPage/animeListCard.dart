import 'package:anime_search/animePage/animePageMain.dart';
import 'package:anime_search/models/AnimeDetail.dart';
import 'package:anime_search/models/AnimeReview.dart';
import 'package:anime_search/models/AnimeSearchResult.dart';
import 'package:anime_search/spfBloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class AnimeCard extends StatelessWidget {
  final Result anime;

  const AnimeCard({Key key, this.anime}) : super(key: key);
  Future<void> buildLoading(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  Future<List<String>> getAnimeRevDetails(Uri uriRev, Uri uriAnimeDetails) async {
    try {
      http.Response response = await http.get(uriRev);
      http.Response responseAnime = await http.get(uriAnimeDetails);
      if (response.statusCode == 200 && responseAnime.statusCode == 200) {
        return [responseAnime.body, response.body];
      }
      return [];
    } catch (e) {}
    return [];
  }

  onTap(BuildContext context) {
    SharedPreferences prefs = Spfbloc().preferences;
    print(anime.malId);
    Uri uriRev = Uri.https("api.jikan.moe", "/v3/anime/${anime.malId}/reviews/");
    Uri uriAnime = Uri.https("api.jikan.moe", "/v3/anime/${anime.malId}");
    if (prefs.containsKey(uriRev.toString()) && prefs.containsKey(uriAnime.toString())) {
      AnimeDetail anime = AnimeDetail.fromRawJson(prefs.getString(uriAnime.toString()));
      AnimeReviewResponse animeReviewResponse = AnimeReviewResponse.fromRawJson(prefs.getString(uriRev.toString()));

      if (animeReviewResponse.reviews.length > 5) {
        animeReviewResponse.reviews = animeReviewResponse.reviews.sublist(0, 5);
      }

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AnimePage(
            anime: anime,
            reviews: animeReviewResponse.reviews,
          ),
        ),
      );
    } else {
      buildLoading(context);
      getAnimeRevDetails(uriRev, uriAnime).then((value) {
        if (value.isEmpty) {
          Navigator.of(context).pop();
          context.showToast(msg: "Error");
        } else {
          prefs.setString(uriRev.toString(), value[1]);
          prefs.setString(uriAnime.toString(), value[0]);
          AnimeDetail anime = AnimeDetail.fromRawJson(value[0]);
          AnimeReviewResponse animeReviewResponse = AnimeReviewResponse.fromRawJson(value[1]);

          if (animeReviewResponse.reviews.length > 5) {
            animeReviewResponse.reviews = animeReviewResponse.reviews.sublist(0, 5);
          }
          Navigator.of(context).pop();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AnimePage(
                anime: anime,
                reviews: animeReviewResponse.reviews,
              ),
            ),
          );
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          onTap(context);
        },
        child: Container(
          height: 165,
          margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              Hero(
                tag: anime.malId,
                child: Container(
                  height: 165,
                  width: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: CachedNetworkImage(imageUrl: anime.imageUrl, fit: BoxFit.fill),
                ),
              ),
              10.widthBox,
              Expanded(
                child: Column(
                  children: [
                    10.heightBox,
                    anime.title.text.color(Colors.white).size(18).overflow(TextOverflow.ellipsis).make(),
                    10.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        anime.type.toString().text.color(Colors.white).size(14).make(),
                        10.widthBox,
                        anime.startDate.toString().substring(0, 4).text.color(Colors.white).size(14).make(),
                        10.widthBox,
                        anime.score.toString().text.white.size(14).make(),
                        10.widthBox,
                        Icon(
                          Icons.person,
                          size: 20,
                          color: Vx.white,
                        ),
                        formatter.format(anime.members).text.white.size(14).make(),
                      ],
                    ),
                    10.heightBox,
                    Text(
                      anime.synopsis,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

var formatter = NumberFormat('##,##,##,000');
