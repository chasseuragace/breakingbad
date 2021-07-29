import 'package:flutter/material.dart';
import 'package:tutor/model/characters.dart';

class CharactersPage extends StatelessWidget {
  final Character character;
  final String tag;
  const CharactersPage({Key key, this.character, this.tag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dynamic Name"),
      ),
      body: Column(
        children: [
          Stack(
            children: [
              //background image mathi ko image
              Container(
                height: 200,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://i.pinimg.com/originals/36/3c/4a/363c4a9baa2ca6b38ceae40259e94a0c.jpg'),
                        fit: BoxFit.cover)),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 18.0, left: 14),
                child: Material(
                  borderRadius: BorderRadius.circular(6),
                  elevation: 3,
                  child: Hero(
                    tag: tag,
                    child: SizedBox(
                      height: 200,
                      width: 150,
                      child: Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(6),
                          child: Image.network(
                            character.img,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              //background image
            ],
          ),
          Text(
            character.name,
          ),
          Text(character.nickname),

          //Text(character.occupation)
        ],
      ),
    );
  }
}
