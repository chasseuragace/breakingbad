import 'package:flutter/material.dart';
import 'package:tutor/model/episodes.dart';
import 'package:tutor/services/data/data_center.dart';

import 'model/characters.dart';

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

// first thing visible
class Homepage extends StatelessWidget {
  Homepage({Key key}) : super(key: key);
  DataManager manager = DataManager();
  @override
  Widget build(BuildContext context) {
    //scaffold Base widget for using Material design
    //yo use na garda text + aaru widget haru eakdam aalu dekhinxa

    return Scaffold(
      //appbar yesari dine

      /* appBar: AppBar(
        // k k paramater xa vanera cmd + click on Widget
        title: Text("Movies"),
        centerTitle: false,
        elevation: 5,
        //todo  title lai center ma dekhaune(Android) start ma dekhaune (IOS)
        //todo  app bar ko last ma search button rakhne
        //todo  appbar ko color change garne
        //todo  app bar ko tala shadow / elevation change garne
        //todo app bar hataune
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          )
        ],
      ),*/
      //main page ko body
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Heading(),
            //todo  yeslai eauta xuttai widget banaune - Name -  SectionWithTitle
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(Icons.movie_creation_outlined),
                  Text("Characters",
                      style: Theme.of(context)
                          .textTheme
                          .headline4
                          .copyWith(fontWeight: FontWeight.bold))
                ],
              ),
            ),
            FutureBuilder(
              future: manager.getCharacters(),
              builder: (context, AsyncSnapshot<List<Character>> characters) {
                return SizedBox(
                    height: 300,
                    // scrollable list ma item dekhaue ListView ra PageView ho mainly
                    // yo duitai ko .builder constructor hunxa to optimize memory
                    // builder use garda jati widget visible xa teti matra memory ma cache rakhxa
                    // use na garda sapai memory ma basxa so dherai item xa vane always use builder
                    //todo PageView.builder use gari herne, kasto dekhinxa
                    child: characters.hasData
                        ? ListView.builder(
                            itemCount: characters.data.length,
                            scrollDirection: Axis.horizontal,
                            //todo pageuse garda try using controller
                            /* controller: PageController(
                          initialPage: 2,
                          // todo suru mai third item dekhaune banaune
                          viewportFraction: .5),*/
                            itemBuilder: (context, index) =>
                                // yelse junsukai widget lai rounded border dina sakxa
                                Padding(
                                  padding: const EdgeInsets.all(
                                    18.0,
                                  ),
                                  // Material widget le shadow/elevation dinxa + border curved banaune option dinxa
                                  // ClipRRect vanne widget le chai border radius ko option dinxa
                                  // child Image xa vane prefer ClipRRect for curved border

                                  child: Material(
                                    borderRadius: BorderRadius.circular(12),
                                    shadowColor: Colors.blue,
                                    elevation: 5,
                                    // color: Colors.red,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Container(
                                          // todo container ko height ghatayera herne
                                          width: 200,
                                          height: 100,
                                          //todo yaa image user garne data payepachi
                                          // todo favourite ko icon pani rakhne
                                          child: Image.network(
                                            characters.data[index].img,
                                            fit: BoxFit.cover,
                                          )),
                                    ),
                                  ),
                                ))
                        : Center(child: CircularProgressIndicator()));
              },
            ),
            // todo yeslai aarko section banaune
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(Icons.bar_chart),
                  Text("Episodes ",
                      style: Theme.of(context)
                          .textTheme
                          .headline4
                          .copyWith(fontWeight: FontWeight.bold))
                ],
              ),
            ),
            // yeslai chai nested refractoring garnu parla
            Expanded(
              child: FutureBuilder<List<Episode>>(
                  future: manager.getEpisode(),
                  builder: (context, AsyncSnapshot<List<Episode>> snapshot) {
                    return snapshot.hasData
                        ? DefaultTabController(
                            length: snapshot.data.length,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 40,
                                  child: TabBar(
                                    unselectedLabelStyle:
                                        TextStyle(color: Colors.red),
                                    labelStyle:
                                        TextStyle(fontWeight: FontWeight.bold),
                                    //todo tabs haru lai scrollable banaune
                                    isScrollable: true,
                                    labelColor: Colors.black,
                                    tabs: snapshot.data
                                        .map((e) => SizedBox(
                                            height: 80,
                                            width: 100,
                                            child: Center(
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
                                    children: snapshot.data
                                        .map((e) => Container(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                      "Starring",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headline5
                                                          .copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.grey),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                      height: 100,
                                                      child: ListView.builder(
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        itemCount:
                                                            e.characters.length,
                                                        itemBuilder:
                                                            (context, index) =>
                                                                Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Column(
                                                            children: [
                                                              CircleAvatar(),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
                                                                        8.0),
                                                                child: Text(
                                                                    e.characters[
                                                                        index]),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      )),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          "Aired on: ",
                                                          style: Theme.of(
                                                                  context)
                                                              .textTheme
                                                              .headline5
                                                              .copyWith(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                      .grey),
                                                        ),
                                                        SizedBox(width: 100),
                                                        Text(
                                                          e.airDate,
                                                          style: Theme.of(
                                                                  context)
                                                              .textTheme
                                                              .headline6
                                                              .copyWith(
                                                                  fontSize: 18,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ))
                                        .toList(),
                                  ),
                                )
                              ],
                            ))
                        : SizedBox(
                            height: 500,
                            child: Center(child: CircularProgressIndicator()),
                          );
                  }),
            )
          ],
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

class Heading extends StatelessWidget {
  const Heading({
    Key key,
  }) : super(key: key);
  final itemColors = Colors.grey;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                Icons.movie_filter,
                color: itemColors,
              ),
              // sizedbox lai as padding use gareko
              //todo use padding widget
              SizedBox(width: 12),
              Text("Breaking Bad",
                  style: Theme.of(context).textTheme.headline4.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: itemColors)),
            ],
          ),
          Icon(
            Icons.search,
          )
        ],
      ),
    );
  }
}
