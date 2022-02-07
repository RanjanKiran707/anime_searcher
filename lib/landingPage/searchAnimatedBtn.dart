import 'dart:io';

import 'package:anime_search/animeListPage/animeListMain.dart';
import 'package:anime_search/landingPage/LandingBloc.dart';
import 'package:anime_search/models/AnimeSearchResult.dart';
import 'package:anime_search/spfBloc.dart';
import 'package:anime_search/theme.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;

Route _routeToaniList(List<Result> list) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => AnimeList(list: list),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(1.0, 0.0);
      var end = Offset.zero;
      var tween = Tween<Offset>(begin: begin, end: end).chain(CurveTween(curve: Curves.easeInCubic));
      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

class SearchAnimated extends StatefulWidget {
  const SearchAnimated({
    Key key,
  }) : super(key: key);

  @override
  _SearchAnimatedState createState() => _SearchAnimatedState();
}

class _SearchAnimatedState extends State<SearchAnimated> {
  @override
  void initState() {
    actual = one;
    super.initState();
  }

  bool disabled = false;
  Widget actual;
  Widget one = const Icon(Icons.search, color: Colors.white, size: 25);
  Widget two = const SizedBox(
    width: 20,
    height: 20,
    child: CircularProgressIndicator(
      strokeWidth: 2,
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Material(
        borderRadius: BorderRadius.circular(20),
        color: themeData.accentColor,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          ////The Click which gives List as Per Genres Selected
          onTap: disabled
              ? null
              : () {
                  List<int> genres = LandingBloc().selected;
                  var prefs = Spfbloc().preferences;

                  String gen = "";
                  if (genres.length > 0) {
                    gen += genres[0].toString();
                  }
                  for (var i = 1; i < genres.length; i++) {
                    gen += ",";
                    gen += genres[i].toString();
                  }
                  print(gen);
                  Uri uri = Uri.https("api.jikan.moe", "/v3/search/anime/", {
                    "q": "",
                    "order_by": "score",
                    "sort": "desc",
                    "genre": gen,
                  });
                  if (prefs.containsKey(uri.toString())) {
                    var searchRes = AnimeSearchResults.fromRawJson(prefs.getString(uri.toString()));

                    Navigator.push(context, _routeToaniList(searchRes.results));
                  } else {
                    setState(() {
                      disabled = true;
                      print(disabled);
                      actual = two;
                    });
                    getAnimeList(context, uri).then(
                      (value) {
                        if (value == null) {
                          context.showToast(msg: "Error : Network or incompatible genres", showTime: 2000);
                          setState(() {
                            actual = one;
                            disabled = false;
                            print(disabled);
                          });
                        } else {
                          var searchRes = AnimeSearchResults.fromRawJson(value);
                          prefs.setString(uri.toString(), value);

                          Navigator.push(context, _routeToaniList(searchRes.results));
                        }
                        setState(() {
                          actual = one;
                          disabled = false;
                          print(disabled);
                        });
                      },
                    );
                  }
                },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedSwitcher(
                  child: actual,
                  duration: Duration(milliseconds: 200),
                ),
                5.widthBox,
                Text("Search", style: themeData.textTheme.headline2),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<String> getAnimeList(BuildContext context, Uri uri) async {
    print(uri);
    try {
      http.Response response = await http.get(uri).timeout(Duration(seconds: 10));
      print(response.statusCode);
      if (response.statusCode == 200) {
        return response.body;
      }
      if (response.statusCode == 404) {
        context.showToast(msg: "Too many genres !");
      }
    } on SocketException catch (_) {
      print("Socket Problem");
      return null;
    } catch (e) {
      print(e);
      context.showToast(msg: "Network Error");
    }
    return null;
  }
}
