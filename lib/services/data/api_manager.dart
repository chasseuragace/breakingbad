import 'package:tutor/model/characters.dart';
import 'package:tutor/services/api/api_service.dart';
import 'package:tutor/model/episodes.dart';

class DataManager {
  Future<List<Character>> getCharacters() async {
    var data = await API().get("https://www.breakingbadapi.com/api/characters");
    Characters characters = Characters.fromJson({"characters": data});
    return characters.characters;
  }

  //todo get episodes - list<Episodes>
  Future<List<Episodes>> getEpisode() async {
    var data = await API().get("www.breakingbadapi.com/api/episodes");
    EpisodeResponse episodes = EpisodeResponse.fromJson({"episodes": data});
    return episodes.episodes;
  }

  //get single character by id
  Future<Character> getCharacterById(String id) async {}
}
