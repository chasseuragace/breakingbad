import 'dart:math';

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
    _characters = characters.characters
      ..sort((a, b) => a.charId.compareTo(b.charId));
  }

  //todo get episodes - list<Episodes>
  _getEpisode() async {
    var data = await API()
        .get("https://www.breakingbadapi.com/api/episodes?series=Breaking+bad");
    Episodes episodes = Episodes.fromJson({"episode": data});
    _episodes = episodes.episode;
  }

  //add to favourite
  addToFavourite(Episode episode) {} //remove from favourite
  removeFromFavourite(Episode episode) {}

  //get single character by id
  Character getCharacterById(int id) {
    return _characters
        .where(
          (element) => element.charId == id,
        )
        .first;
  }

  String imageOfCharater(String name) {
    return _characters
        .singleWhere((element) => element.name == name,
            orElse: () => Character(img: ""))
        .img;
  }

  List<Episode> episodesInSeasion(int season) {
    //todo based on imput "season" find list of episodes for that season
    return _episodes.where((element) => element.season == "$season").toList();
  }

  int getTotalNumberOfSeasons() {
    return int.tryParse(_episodes
        .reduce((value, element) => Episode(
            season: max(int.tryParse(value.season ?? "0") ?? 0,
                    int.tryParse(element.season ?? "0") ?? 1)
                .toString()))
        .season);
  }
// todo change ui
// replace Episodes sections with Seasons
//configure tabbar to display Season 1 2 3..
//remove the starring section
//configure tabbarView to display Episodes in that season
//for each Episode: display 2x2 matrix image of characters  as thumbnail
// create a add to favourite button for each episode -

//todo functionality
// navigate to character detail page on tap on image

}