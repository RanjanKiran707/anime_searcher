import 'package:anime_search/landingPage/LandingBloc.dart';
import 'package:anime_search/theme.dart';
import 'package:flutter/material.dart';

class GenreItem extends StatelessWidget {
  final int index;
  final String name;

  GenreItem(this.name, this.index) : super();
  @override
  Widget build(BuildContext context) {
    bool selected = false;
    return StreamBuilder<List<int>>(
        stream: LandingBloc().controller.stream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.contains(index)) {
              selected = true;
            } else {
              selected = false;
            }
          }
          return GestureDetector(
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: selected ? Colors.grey[700] : themeData.accentColor,
              ),
              child: Text(
                name,
                style: themeData.textTheme.bodyText1,
              ),
            ),
            onTap: () {
              LandingBloc().toggle(index);
            },
          );
        });
  }
}
