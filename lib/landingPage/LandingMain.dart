import 'package:anime_search/landingPage/LandingBloc.dart';
import 'package:anime_search/landingPage/LandingWrap.dart';
import 'package:anime_search/landingPage/searchAnimatedBtn.dart';

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:anime_search/theme.dart';

class Landing extends StatefulWidget {
  const Landing({
    Key key,
  }) : super(key: key);

  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  List<int> selectedGenre = [];

  @override
  void initState() {
    LandingBloc().controller.stream.listen((event) {
      print((event));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themeData.primaryColor,
      appBar: AppBar(
        backgroundColor: themeData.primaryColor,
        title: Text('Anime Search', style: themeData.textTheme.headline1),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Column(
        children: [
          Container(
            color: Colors.transparent,
            height: context.screenHeight * 8 / 10,
            width: context.screenWidth,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  10.heightBox,
                  Text(
                    "Select Genre(s)",
                    style: themeData.textTheme.headline2,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: SingleChildScrollView(
                        child: LandingWrap(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          BottomButtons()
        ],
      ),
    );
  }
}

class BottomButtons extends StatelessWidget {
  const BottomButtons({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10, top: 5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            10.widthBox,
            Expanded(
              flex: 2,
              child: Container(
                child: Material(
                  borderRadius: BorderRadius.circular(20),
                  color: themeData.accentColor,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: () {
                      LandingBloc().clear();
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.close, color: Colors.white, size: 25),
                          5.widthBox,
                          Text("Reset", style: themeData.textTheme.headline2),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            5.widthBox,
            Expanded(
              flex: 4,
              child: SearchAnimated(),
            ),
            10.widthBox,
          ],
        ),
      ),
    );
  }
}
