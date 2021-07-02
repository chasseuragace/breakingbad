import 'package:flutter/material.dart';
import 'package:tutor/model/characters.dart';
import 'package:tutor/model/episodes.dart';
import 'package:tutor/services/api/api_service.dart';

class DataManager {
  List<Character> _characters;
  List<Character> get characters => _characters;

  ValueNotifier<bool> isLoading = ValueNotifier(true);

  getData() async {
    await _getCharacters();
    await _getEpisode();
    isLoading.value = false;
  }

  DataManager() {
    getData();
  }

  List<Episode> _episodes;
  List<Episode> get episodes => _episodes;

  _getCharacters() async {
    var data = await API().get("https://www.breakingbadapi.com/api/characters");
    BadCharacters characters = BadCharacters.fromJson({"characters": data});
    _characters = characters.characters;
  }

  //todo get episodes - list<Episodes>
  _getEpisode() async {
    var data = await API().get("https://www.breakingbadapi.com/api/episodes");
    Episodes episodes = Episodes.fromJson({"episode": data});
    _episodes = episodes.episode;
  }

  //add to favourite
  addToFavourite(Episode episode) {} //remove from favourite
  removeFromFavourite(Episode episode) {}

  //get single character by id
  Future<Character> getCharacterById(String id) async {}
}
