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
                        tabs: [
                          Tab(
                            child: Text("Episode 1"),
                          ),
                          Tab(
                            child: Text("Episode 2"),
                          ),
                          Tab(
                            child: Text("Episode 3"),
                          ),
                          Tab(
                            child: Text("Episode 4"),
                          ),
                          Tab(
                            child: Text("Episode 5"),
                          ),
                        ],
                        //.map((e) => SizedBox(width: 50, child: e)).toList()),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .6,
                      child: TabBarView(
                        children: [
                          if (false)
                            Container(
                                child: ListView.builder(
                              shrinkWrap: true,
                              itemBuilder: (contrext, index) =>
                                  ListTile(title: Text("item")),
                            )),
                          Text("page 1"),
                          Text("page 2"),
                          Text("page 3"),
                          Text("page 4"),
                          Text("page 5"),
                        ].map((e) => Center(child: e)).toList(),
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
