import 'package:anime_search/landingPage/LandingMain.dart';
import 'package:anime_search/spfBloc.dart';
import 'package:anime_search/theme.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Future<void> initSP() async {
    Spfbloc().preferences = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Anime Search',
      home: FutureBuilder<void>(
        future: initSP(),
        builder: (context, snapshot) {
          return snapshot.connectionState == ConnectionState.done
              ? Landing()
              : Scaffold(
                  backgroundColor: themeData.primaryColor,
                  body: Center(child: CircularProgressIndicator()),
                );
        },
      ),
    );
  }
}
