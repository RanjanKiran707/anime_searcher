import 'package:anime_search/models/AnimeReview.dart';
import 'package:anime_search/theme.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class AnimePageReviews extends StatelessWidget {
  const AnimePageReviews({
    Key key,
    @required this.reviews,
  }) : super(key: key);

  final List<Review> reviews;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: themeData.accentColor,
      child: ExpansionTile(
        title: Text("o"),
        leading: Text(
          "Reviews",
          style: themeData.textTheme.headline2,
        ),
        trailing: Icon(Icons.expand_more, color: Colors.white),
        children: reviews.asMap().entries.map((e) {
          return ExpansionTile(
            title: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  Icon(
                    Icons.thumb_up_alt,
                    color: Colors.grey,
                    size: 20,
                  ),
                  5.widthBox,
                  Text(e.value.helpfulCount.toString()).text.size(18).gray500.make(),
                ],
              ),
            ),
            leading: Text(
              "${e.key + 1}",
              style: themeData.textTheme.bodyText1,
            ),
            trailing: Text(
              "Score - ${e.value.reviewer.scores.overall}",
              style: themeData.textTheme.bodyText1,
            ),
            backgroundColor: themeData.primaryColor,
            children: [
              ListTile(
                contentPadding: const EdgeInsets.all(10),
                title: RichText(
                  text: TextSpan(
                    style: themeData.textTheme.bodyText1,
                    text: e.value.content.replaceAll("&quot;", '"').replaceAll("\\n", "").replaceAll("&rsquo;", "'"),
                  ),
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}
