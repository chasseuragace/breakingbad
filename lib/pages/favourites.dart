import 'package:flutter/material.dart';
import 'package:tutor/main.dart';
import 'package:tutor/services/data/api_manager.dart';

class FavouritesPage extends StatelessWidget {
  DataManager manager;
  FavouritesPage(this.manager);

  @override
  Widget build(BuildContext context) {
    var favourites = database.getFavourites();
    return Scaffold(
        appBar: AppBar(title: Text('Favourites')),
        body: Column(
          children: [
            Text('My favourite Characters'),
            Expanded(
                child: ListView.builder(
                    itemCount: favourites.length,
                    itemBuilder: (BuildContext context, int index) {
                      var currentCharacter =
                          manager.getCharacterById(favourites[index]);
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          leading: Image.network(currentCharacter.img),
                          title: Text(currentCharacter.name),
                        ),
                      );
                    }))
          ],
        ));
  }
}
