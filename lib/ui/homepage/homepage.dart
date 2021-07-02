import 'package:flutter/material.dart';
import 'package:tutor/services/data/data_center.dart';
import 'package:tutor/ui/homepage/character_carousel.dart';
import 'package:tutor/ui/homepage/heading.dart';
import 'package:tutor/ui/homepage/season_carousel.dart';
import 'package:tutor/ui/shared/widgets.dart';

class Homepage extends StatelessWidget {
  Homepage({Key key}) : super(key: key);
  DataManager manager = DataManager();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Heading(
                title: "Breaking Bad",
                icon: Icons.movie_filter,
              ),
              SectionHeading(
                  title: "Characters", icon: Icons.movie_creation_outlined),
              CharacterCarousel(manager: manager),
              SectionHeading(
                title: "Seasons",
                icon: Icons.bar_chart,
              ),
              SeasonCarousel(manager: manager)
            ],
          ),
        ),
      ),
      // bottom ma navigation bar dekhanu
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Setting")
          //todo  favoutire vanne section rakhne
        ],
      ),
    );
  }
}
