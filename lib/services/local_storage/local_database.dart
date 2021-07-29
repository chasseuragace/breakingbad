//local database ma CRUD garna API manager jastqai class banaune

import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class DatabaseService {
  static const String FAVOURITES_KEY = "favourites";

  SharedPreferences _sp;

// initialize shared preferences
  init() async {
    print("getting sp");
    SharedPreferences.getInstance().then((value) {
      _sp = value;
      print("got sp");
    });
  }

  //getting data
  List<int> getFavourites() {
    if (_sp == null) return [];
    var favoutires = _sp.getString(FAVOURITES_KEY);

    List<int> initialFavourites =
        (favoutires != null) ? List.from(jsonDecode(favoutires)) : <int>[];
    return initialFavourites;
    //  {"favourites":"['id1','id2']"};
  }

// storing data
  addToFavourites(int characterID) async {
    //fetching existing list of favourites
    var favoutires = getFavourites();
    favoutires.add(characterID);
    await _sp.setString(FAVOURITES_KEY, jsonEncode(favoutires));
  }

  bool isPresent(int id) {
    return getFavourites().contains(id);
  }

  _removeFromFav(int id) async {
    var favoutires = getFavourites();
    favoutires.remove(id);
    await _sp.setString(FAVOURITES_KEY, jsonEncode(favoutires));
  }

  addRemoveFromFavourites(int id) async {
    return isPresent(id) ? _removeFromFav(id) : addToFavourites(id);
  }

  removeall() {
    // _sp.clear();
  }
}
