import 'package:flutter/foundation.dart';
import 'package:tutor/model/characters.dart';
import 'package:tutor/services/api/api_service.dart';
import 'package:tutor/model/episodes.dart';

class DataManager {
  List<Character> characterList;
  List<Episodes> episodeList;

  bool isLoaded = false;
  DataManager() {
    getAllData();
  }

  getAllData() async {
    await getCharacters();
    await getEpisode();
    isLoaded = true;
  }

  Future<List<Character>> getCharacters() async {
    // using saved cache for subsequent calls
    if (characterList == null) {
      var data =
          await API().get("https://www.breakingbadapi.com/api/characters");
      Characters characters = Characters.fromJson({"characters": data});
      //saving fetched data
      characterList = characters.characters;

      return characterList;
    } else
      return characterList;
  }

  //todo get episodes - list<Episodes>
  Future<List<Episodes>> getEpisode() async {
    if (episodeList == null) {
      var data = await API().get(
          "https://www.breakingbadapi.com/api/episodes?series=Breaking+Bad");
      EpisodeResponse episodes = EpisodeResponse.fromJson({"episodes": data});
      // debugPrint('${episodes.episodes.length}');
      episodeList = episodes.episodes;
      return episodeList;
    } else
      return episodeList;
  }

  //get single character by id
  Character getCharacterById(int id) {
    return characterList
        .where(
          (element) => element.charId == id,
        )
        .first;
  }

  String getImageForCharacter(String name) {
    try {
      return characterList.where((element) => element.name == name).first.img;
    } catch (e) {
      return "";
    }
  }
}
