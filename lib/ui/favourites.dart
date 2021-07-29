import 'package:flutter/material.dart';
import 'package:tutor/main.dart';
import 'package:tutor/model/characters.dart';
import 'package:tutor/services/data/data_center.dart';
import 'package:tutor/ui/shared/widgets.dart';

import 'characters_page.dart';

class FavouritesPage extends StatelessWidget {
  DataManager manager;

  FavouritesPage(this.manager);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(title: Text('Favourites')),
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeading(
          title: "My Favourites",
          icon: Icons.supervised_user_circle_sharp,
        ),
        ValueListenableBuilder(
          valueListenable: manager.isLoading,
          builder: (BuildContext context, bool isLoading, Widget child) {
            if (isLoading)
              return Center(child: CircularProgressIndicator());
            else {
              return Expanded(
                  child: ValueListenableBuilder(
                      valueListenable: database.isLoading,
                      builder: (BuildContext context, isLoading, Widget child) {
                        if (isLoading)
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        else {
                          var favourites = database.getFavourites();
                          if (favourites.isEmpty)
                            return Center(
                              child:
                                  Text("Don't be choosy!\n Pick a favourite."),
                            );
                          return ListView.builder(
                              itemCount: favourites.length,
                              itemBuilder: (BuildContext context, int index) {
                                var currentCharacter =
                                    manager.getCharacterById(favourites[index]);
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CharacterListTIle(
                                      currentCharacter: currentCharacter),
                                );
                              });
                        }
                      }));
            }
          },
        )
      ],
    ));
  }
}

class CharacterListTIle extends StatelessWidget {
  const CharacterListTIle({
    Key key,
    @required this.currentCharacter,
  }) : super(key: key);

  final Character currentCharacter;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        //manager.appearencePerSeason(currentCharacter.charId);

        Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => CharactersPage(
                  character: currentCharacter,
                  tag: "fav-${currentCharacter.charId}",
                )));
      },
      leading: Hero(
        tag: "fav-${currentCharacter.charId}",
        child: SizedBox(
            width: 50,
            child: Image.network(
              currentCharacter.img,
              fit: BoxFit.cover,
            )),
      ),
      title: Text(currentCharacter.name),
      trailing: IconButton(
        onPressed: () {
          database.addRemoveFromFavourites(currentCharacter.charId);
        },
        icon: Icon(Icons.delete),
      ),
    );
  }
}
