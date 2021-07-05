import 'package:flutter/material.dart';
import 'package:tutor/services/data/data_center.dart';
import 'package:tutor/ui/homepage/character_carousel.dart';
import 'package:tutor/ui/homepage/heading.dart';
import 'package:tutor/ui/homepage/homepage.dart';
import 'package:tutor/ui/shared/widgets.dart';

//  https://www.pinterest.com/pin/76490893660383367/
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Breaking Bad',
      // todo switch to dark/ligth theme
      // todo app ko lagi aafnai color scheme define garne

      home: Homepage(),
    );
  }
}

class Nested extends StatelessWidget {
  Nested({Key key}) : super(key: key);
  DataManager manager = DataManager();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (c, b) => [
          SliverAppBar(
            collapsedHeight: 500 - 96.0,
            expandedHeight: 500 - 96.0,
            flexibleSpace: Column(
              children: [
                Heading(
                  title: "Breaking Bad",
                  icon: Icons.movie_filter,
                ),
                SectionHeading(
                    title: "Characters", icon: Icons.movie_creation_outlined),
                CharacterCarousel(manager: manager),
              ],
            ),
            floating: true,
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: Delegate(
              child: PreferredSize(
                preferredSize: Size.fromHeight(100),
                child: Column(
                  children: [
                    SectionHeading(
                      title: "Seasons",
                      icon: Icons.bar_chart,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
        body: Container(
          height: 1400,
          color: Colors.green,
        ),
      ),
    );
  }
}

class Delegate extends SliverPersistentHeaderDelegate {
  final Color backgroundColor;

  final Widget child;
  Delegate({this.backgroundColor, this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Material(child: child);
  }

  @override
  double get maxExtent => 100;

  @override
  double get minExtent => 100;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
