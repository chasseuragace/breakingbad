import 'package:flutter/material.dart';
import 'package:tutor/model/episodes.dart';
import 'package:tutor/services/data/api_manager.dart';

class EpisodeSection extends StatelessWidget {
  const EpisodeSection({
    Key key,
    @required this.manager,
  }) : super(key: key);

  final DataManager manager;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: manager.getEpisode(),
      builder: (context, AsyncSnapshot<List<Episodes>> episodes) {
        return (episodes.hasData
            ? DefaultTabController(
                length: episodes.data.length,
                child: Column(
                  children: [
                    SizedBox(
                      height: 40,
                      child: TabBar(
                        unselectedLabelStyle: TextStyle(color: Colors.red),
                        labelStyle: TextStyle(fontWeight: FontWeight.bold),
                        //todo tabs haru lai scrollable banaune
                        labelColor: Colors.black,
                        isScrollable: true,
                        tabs: [
                          ...episodes.data.map((episode) => Tab(
                                  child: Text(
                                episode.title,
                                style: TextStyle(color: Colors.black),
                              ))),
                        ],
                        //.map((e) => SizedBox(width: 50, child: e)).toList()),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .6,
                      child: TabBarView(
                        children: [
                          ...episodes.data.map((episode) => Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      episode.title,
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 20),
                                    ),
                                    Text('Aired on: ${episode.airDate}'),
                                    RichText(
                                      text: TextSpan(
                                          text: 'Aired on:',
                                          style: TextStyle(color: Colors.black),
                                          children: [
                                            TextSpan(
                                                text: episode.airDate,
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold))
                                          ]),
                                    )
                                  ],
                                ),
                              ))
                        ],
                      ),
                    )
                  ],
                ))
            : SizedBox(
                height: 500,
                child: Center(child: CircularProgressIndicator()),
              ));
      },
    );
  }
}
