
import 'package:flutter/material.dart';
import 'package:tutor/animation.dart';
import 'package:tutor/model/characters.dart';
import 'package:tutor/services/data/data_center.dart';

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
                itemBuilder: (context, index) =>
                ScaleAnimation(
                  child: Padding(
                    padding: const EdgeInsets.all(
                      18.0,
                    ),
                    child: CharacterCard(character: manager.characters[index]),
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
    return Column(
      children: [
        Expanded(
          child: Material(
            borderRadius:
            BorderRadius.circular(12),
            shadowColor: Colors.blue,
            elevation: 5,

            child: ClipRRect(
              borderRadius:
              BorderRadius.circular(12),
              child: Container(

                  width: 200,
                  height: 100,

                  child: Image.network(
                    character
                        .img,
                    fit: BoxFit.cover,
                  )),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
              character.name),
        )
      ],
    );
  }
}
