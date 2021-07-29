import 'package:flutter/material.dart';
import 'package:tutor/components/characterCarousel.dart';
import 'package:tutor/components/episodeSection.dart';
import 'package:tutor/components/heading.dart';
import 'package:tutor/main.dart';
import 'package:tutor/model/characters.dart';
import 'package:tutor/model/episodes.dart';
import 'package:tutor/pages/favourites.dart';
import 'package:tutor/services/data/api_manager.dart';

class Homepage extends StatelessWidget {
  Homepage({Key key}) : super(key: key);
  DataManager manager = DataManager();
  final ValueNotifier<int> navigationBarController = ValueNotifier(0);
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
      body: ValueListenableBuilder<int>(
          valueListenable: navigationBarController,
          builder: (context, value, child) {
            return IndexedStack(
              index: value,
              children: [
                SingleChildScrollView(
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
                              Text("Characters",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4
                                      .copyWith(fontWeight: FontWeight.bold))
                            ],
                          ),
                        ),
                        CharacterCarousel(manager: manager),
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
                        EpisodeSection(manager: manager)
                      ],
                    ),
                  ),
                ),
                FavouritesPage(manager),
                Text('setting')
              ],
            );
          }),
      // bottom ma navigation bar dekhanu
      bottomNavigationBar: ValueListenableBuilder<int>(
          valueListenable: navigationBarController,
          builder: (context, value, child) {
            return BottomNavigationBar(
              currentIndex: value,
              onTap: (index) {
                database.init();
                print('current $index');
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


