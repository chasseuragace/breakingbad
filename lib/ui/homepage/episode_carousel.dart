import 'package:flutter/material.dart';
import 'package:tutor/model/episodes.dart';
import 'package:tutor/services/data/data_center.dart';

class EpisodesCarousel extends StatelessWidget {
  const EpisodesCarousel({
    Key key,
    @required this.manager,
  }) : super(key: key);

  final DataManager manager;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
        valueListenable: manager.isLoading,
        builder: (context, bool isLoading, _) {
          return SizedBox(
            height: 500,
            child: Center(
                child: isLoading
                    ? CircularProgressIndicator()
                    : DefaultTabController(
                        length: manager.episodes.length,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 40,
                              child: TabBar(
                                unselectedLabelStyle:
                                    TextStyle(color: Colors.red),
                                labelStyle:
                                    TextStyle(fontWeight: FontWeight.bold),
                                isScrollable: true,
                                labelColor: Colors.black,
                                tabs: manager.episodes
                                    .map((e) => SizedBox(
                                        width: 100,
                                        child: Tab(
                                          child: Text(
                                            e.title,
                                            textAlign: TextAlign.center,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        )))
                                    .toList(),
                              ),
                            ),
                            Expanded(
                              child: TabBarView(
                                physics: NeverScrollableScrollPhysics(),
                                children: manager.episodes
                                    .map((e) => EpisodeContentPage(
                                          episode: e,
                                          manager: manager,
                                        ))
                                    .toList(),
                              ),
                            )
                          ],
                        ))),
          );
        });
  }
}

class EpisodeContentPage extends StatelessWidget {
  const EpisodeContentPage({
    Key key,
    this.episode,
    this.manager,
  }) : super(key: key);

  final Episode episode;
  final manager;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Starring",
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  .copyWith(fontWeight: FontWeight.bold, color: Colors.grey),
            ),
          ),
          SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: episode.characters.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                            manager.imageOfCharater(episode.characters[index])),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(episode.characters[index]),
                      )
                    ],
                  ),
                ),
              )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  "Aired on: ",
                  style: Theme.of(context).textTheme.headline5.copyWith(
                      fontWeight: FontWeight.bold, color: Colors.grey),
                ),
                SizedBox(width: 100),
                Text(
                  episode.airDate,
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
