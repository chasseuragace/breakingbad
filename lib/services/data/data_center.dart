import 'package:tutor/model/characters.dart';
import 'package:tutor/model/episodes.dart';
import 'package:tutor/services/api/api_service.dart';

class DataManager {
  Future<List<Character>> getCharacters() async {
    var data = await API().get("https://www.breakingbadapi.com/api/characters");
    Characters characters = Characters.fromJson({"characters": data});
    return characters.characters;
  }

  //todo get episodes - list<Episodes>
  Future<List<Episode>> getEpisode() async {
    var data = await API().get("https://www.breakingbadapi.com/api/episodes");
    Episodes episodes = Episodes.fromJson({"episode": data});
    return episodes.episode;
  }

  //add to favourite
  addToFavourite(Episode episode) {} //remove from favourite
  removeFromFavourite(Episode episode) {}

  //get single character by id
  Future<Character> getCharacterById(String id) async {}
}
