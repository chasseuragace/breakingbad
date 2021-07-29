import 'package:flutter/material.dart';
import 'package:tutor/ui/homepage/character_carousel.dart';
import 'package:tutor/ui/homepage/heading.dart';
import 'package:tutor/ui/homepage/season_carousel.dart';
import 'package:tutor/ui/shared/widgets.dart';

import '../../main.dart';
import '../favourites.dart';

class Homepage extends StatelessWidget {
  Homepage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: navigationBarController,
          builder: (_, value, child) {
            return Column(
              children: [
                Heading(
                  title: "Breaking Bad",
                  icon: Icons.movie_filter,
                ),
                Expanded(
                  child: IndexedStack(
                    index: value,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SectionHeading(
                              title: "Characters",
                              icon: Icons.movie_creation_outlined),
                          CharacterCarousel(manager: manager),
                          SectionHeading(
                            title: "Seasons",
                            icon: Icons.bar_chart,
                          ),
                          Expanded(child: SeasonCarousel(manager: manager))
                        ],
                      ),
                      FavouritesPage(manager),
                      Text('setting')
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
      // bottom ma navigation bar dekhanu
      bottomNavigationBar: ValueListenableBuilder<int>(
          valueListenable: navigationBarController,
          builder: (context, value, child) {
            return BottomNavigationBar(
              currentIndex: value,
              onTap: (index) {
                navigationBarController.value = index;
              },
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.favorite), label: "Favourites"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings), label: "Setting")
                //todo  favoutire vanne section rakhne
              ],
            );
          }),
    );
  }
}
