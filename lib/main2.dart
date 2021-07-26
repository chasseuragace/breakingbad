import 'package:flutter/material.dart';

//  https://www.pinterest.com/pin/76490893660383367/
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // todo switch to dark/ligth theme
      // todo app ko lagi aafnai color scheme define garne

      home: Homepage(),
    );
  }
}

// first thing visible
class Homepage extends StatelessWidget {
  const Homepage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //scaffold Base widget for using Material design
    //yo use na garda text + aaru widget haru eakdam aalu dekhinxa

    return Scaffold(
      //appbar yesari dine

      /* appBar: AppBar(
        // k k paramater xa vanera cmd + click on Widget
        title: Text("Movies"),

        //todo  title lai center ma dekhaune(Android) start ma dekhaune (IOS)
        //todo  app bar ko last ma search button rakhne
        //todo  appbar ko color change garne
        //todo  app bar ko tala shadow / elevation change garne
        //todo app bar hataune
      ),*/
      //main page ko body
      body: SingleChildScrollView(
        child: SafeArea(
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
                    Text("Today",
                        style: Theme.of(context)
                            .textTheme
                            .headline4
                            .copyWith(fontWeight: FontWeight.bold))
                  ],
                ),
              ),
              SizedBox(
                  height: 300,
                  // scrollable list ma item dekhaue ListView ra PageView ho mainly
                  // yo duitai ko .builder constructor hunxa to optimize memory
                  // builder use garda jati widget visible xa teti matra memory ma cache rakhxa
                  // use na garda sapai memory ma basxa so dherai item xa vane always use builder
                  //todo PageView.builder use gari herne, kasto dekhinxa
                  child: ListView.builder(
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
                              child: Container(
                                  // todo container ko height ghatayera herne
                                  width: 200,
                                  height: 100,
                                  //todo yaa image user garne data payepachi
                                  // todo favourite ko icon pani rakhne
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Placeholder(
                                      color: Colors.grey[200],
                                    ),
                                  )),
                            ),
                          ))),
              // todo yeslai aarko section banaune
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(Icons.bar_chart),
                    Text("Trending ",
                        style: Theme.of(context)
                            .textTheme
                            .headline4
                            .copyWith(fontWeight: FontWeight.bold))
                  ],
                ),
              ),
              // yeslai chai nested refractoring garnu parla
              DefaultTabController(
                  length: 5,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 40,
                        child: TabBar(
                          unselectedLabelStyle: TextStyle(color: Colors.grey),
                          labelStyle: TextStyle(fontWeight: FontWeight.bold),
                          //todo tabs haru lai scrollable banaune
                          labelColor: Colors.black,
                          tabs: [
                            Tab(
                              child: Text("Action"),
                            ),
                            Tab(
                              child: Text("Drama"),
                            ),
                            Tab(
                              child: Text("Horror"),
                            ),
                            Tab(
                              child: Text("Horror"),
                            ),
                            Tab(
                              child: Text("Horror"),
                            ),
                          ],
                          //.map((e) => SizedBox(width: 50, child: e)).toList()),
                        ),
                      ),
                      Builder(
                        builder: (c) {
                          ScrollController _controller = ScrollController();
                          return SizedBox(
                            height: MediaQuery.of(context).size.height * .6,
                            child: TabBarView(
                              children: [
                                Page1(),
                                Text("page 2"),
                                Text("page 3"),
                                Text("page 4"),
                                Text("page 5"),
                              ].map((e) => Center(child: e)).toList(),
                            ),
                          );
                        },
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
      // bottom ma navigation bar dekhanu
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: "Favourites"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Setting")
          //todo  favoutire vanne section rakhne
        ],
      ),
    );
  }
}

class Page1 extends StatefulWidget {
  const Page1({
    Key key,
  }) : super(key: key);

  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  ScrollController _conreoller;
  @override
  void initState() {
    _conreoller = ScrollController();
    _conreoller.addListener(listen);

    super.initState();
  }

  listen() {
//  scroll
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.builder(
      shrinkWrap: true,
      itemBuilder: (contrext, index) => ListTile(title: Text("item")),
    ));
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
              Text("Movies",
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
