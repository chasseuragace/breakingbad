import 'package:flutter/material.dart';
import 'package:tutor/components/characterCarousel.dart';
import 'package:tutor/components/episodeSection.dart';
import 'package:tutor/components/heading.dart';
import 'package:tutor/services/data/api_manager.dart';

class MainPage extends StatelessWidget {
  const MainPage({
    Key key,
    @required this.manager,
  }) : super(key: key);

  final DataManager manager;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Heading(),
            SectionWithTitle(title: "Characters", icon: Icon(Icons.movie)),
            CharacterCarousel(manager: manager),
            // todo yeslai aarko section banaune
            SectionWithTitle(
                title: "Episodes", icon: Icon(Icons.trending_down)),
            EpisodeSection(manager: manager)
          ],
        ),
      ),
    );
  }
}

class SectionWithTitle extends StatelessWidget {
  final Icon icon;
  final String title;
  const SectionWithTitle({
    Key key,
    this.icon,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          icon,
          SizedBox(
            width: 12,
          ),
          Text(title,
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  .copyWith(fontWeight: FontWeight.bold))
        ],
      ),
    );
  }
}
