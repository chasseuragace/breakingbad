import 'package:flutter/material.dart';
import 'package:tutor/model/episodes.dart';
import 'package:tutor/services/data/data_center.dart';

class SeasonCarousel extends StatelessWidget {
  const SeasonCarousel({
    Key key,
    @required this.manager,
  }) : super(key: key);

  final DataManager manager;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
        valueListenable: manager.isLoading,
        builder: (context, bool isLoading, _) {
          return Center(
              child: isLoading
                  ? CircularProgressIndicator()
                  : DefaultTabController(
                      length: manager.getTotalNumberOfSeasons(),
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
                              tabs: List.generate(
                                      manager.getTotalNumberOfSeasons(),
                                      (i) => i)
                                  .map((e) => SizedBox(
                                      width: 100,
                                      child: Tab(
                                        child: Text(
                                          "Season ${e + 1}",
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
                              //physics: NeverScrollableScrollPhysics(),
                              children: List.generate(
                                      manager.getTotalNumberOfSeasons(),
                                      (i) => i)
                                  .map((e) => SeasonContent(
                                        episode:
                                            manager.episodesInSeasion(e + 1),
                                        manager: manager,
                                      ))
                                  .toList(),
                            ),
                          )
                        ],
                      )));
        });
  }
}

class SeasonContent extends StatelessWidget {
  const SeasonContent({
    Key key,
    this.episode,
    this.manager,
  }) : super(key: key);

  final List<Episode> episode;
  final DataManager manager;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            Stack(
              children: [
                Center(
                  child: Wrap(
                      children: episode.map((e) {
                    var width = (MediaQuery.of(context).size.width / 3) * .88;
                    return Container(
                      width: width,
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Container(
                            width: width,
                            height: width,
                            child: Center(
                              child: Wrap(
                                runSpacing: 8,
                                spacing: 8,
                                children: [
                                  ...(List.from(manager.characters)..shuffle())
                                      .take(4)
                                      .map((e) => ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(6),
                                            child: SizedBox(
                                                width: (width * 3 / 9) / .88,
                                                height: (width * 3 / 9) / .88,
                                                child: Image.network(
                                                  e.img,
                                                  fit: BoxFit.cover,
                                                )),
                                          ))
                                ],
                              ),
                            ),
                          ),
                          Text("Episode ${e.episode}"),
                          Text(
                            "${e.title}",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    );
                  }).toList()),
                ),
              ],
            ),
            /*
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
            ),*/
          ],
        ),
      ),
    );
  }
}
