import 'package:flutter/material.dart';
import 'package:tutor/animation.dart';
import 'package:tutor/model/characters.dart';
import 'package:tutor/services/data/data_center.dart';

import '../../main.dart';
import '../characters_page.dart';

class CharacterCarousel extends StatelessWidget {
  const CharacterCarousel({
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
            height: 300,
            child: isLoading
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
                    cacheExtent: 3,
                    itemCount: manager.characters.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => ScaleAnimation(
                          child: Padding(
                            padding: const EdgeInsets.all(
                              18.0,
                            ),
                            child: CharacterCard(
                                character: manager.characters[index]),
                          ),
                        )));
      },
    );
  }
}

class CharacterCard extends StatelessWidget {
  final Character character;
  const CharacterCard({
    Key key,
    this.character,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => CharactersPage(
                  character: character,
                  tag: "caro-${character.charId}",
                )));
      },
      child: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Material(
                  borderRadius: BorderRadius.circular(12),
                  shadowColor: Colors.blue,
                  elevation: 5,
                  child: Hero(
                    tag: "caro-${character.charId}",
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                          height: 300,
                          width: 200,
                          child: Image.network(
                            character.img,
                            fit: BoxFit.cover,
                          )),
                    ),
                  ),
                ),
                Positioned(
                    bottom: 0,
                    right: 0,
                    child: AddRemoveFromFavoutiresbutton(
                      id: character.charId,
                    ))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(character.name),
          )
        ],
      ),
    );
  }
}

class AddRemoveFromFavoutiresbutton extends StatefulWidget {
  final id;
  const AddRemoveFromFavoutiresbutton({
    Key key,
    this.id,
  }) : super(key: key);

  @override
  _AddRemoveFromFavoutiresbuttonState createState() =>
      _AddRemoveFromFavoutiresbuttonState();
}

class _AddRemoveFromFavoutiresbuttonState
    extends State<AddRemoveFromFavoutiresbutton> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: UniqueKey(),
      mini: true,
      onPressed: () async {
        await database.addRemoveFromFavourites(widget.id);
        //1 todo:  already fav ma xa vane remove from favourite
        setState(() {});
      },
      child: Icon(
        Icons.favorite,
        color: database.isPresent(widget.id) ? Colors.red : null,
      ),
    );
  }
}
