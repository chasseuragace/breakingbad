import 'package:flutter/material.dart';
import 'package:tutor/pages/favourites.dart';
import 'package:tutor/services/data/api_manager.dart';

import 'main_page.dart';

class Homepage extends StatelessWidget {
  Homepage({Key key}) : super(key: key);
  DataManager manager = DataManager();
  final ValueNotifier<int> navigationBarController = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder<int>(
          valueListenable: navigationBarController,
          builder: (context, value, child) {
            return IndexedStack(
              index: value,
              children: [
                MainPage(manager: manager),
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
              onTap: setCurrentpage,
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

  setCurrentpage(index) {
    navigationBarController.value = index;
  }
}
