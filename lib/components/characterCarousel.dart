import 'package:flutter/material.dart';
import 'package:tutor/model/characters.dart';
import 'package:tutor/pages/characters_page.dart';
import 'package:tutor/services/data/api_manager.dart';

class CharacterCarousel extends StatelessWidget {
  const CharacterCarousel({
    Key key,
    @required this.manager,
  }) : super(key: key);

  final DataManager manager;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
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
                          // Material widget le shadow/elevation dinxa + border curved banaune option dinxa`
                          // ClipRRect vanne widget le chai border radius ko option dinxa
                          // child Image xa vane prefer ClipRRect for curved border

                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => CharactersPage(
                                      character: characters.data[index])));
                            },
                            child: Column(
                              children: [
                                Expanded(
                                  child: Card(
                                    shadowColor: Colors.blue,
                                    elevation: 5,
                                    child: Container(
                                        // todo container ko height ghatayera herne
                                        width: 200,

                                        //todo yaa image user garne data payepachi
                                        // todo favourite ko icon pani rakhne
                                        child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Hero(
                                              tag:
                                                  "${characters.data[index].charId}",
                                              child: Image.network(
                                                  characters.data[index].img),
                                            ))),
                                  ),
                                ),
                                Text(characters.data[index].name)
                              ],
                            ),
                          ),
                        ))
                : Center(child: CircularProgressIndicator()));
      },
    );
  }
}
