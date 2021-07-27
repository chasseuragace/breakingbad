//local database ma CRUD garna API manager jastqai class banaune

import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class DatabaseService {
  static const String FAVOURITES_KEY = "favourites";

  SharedPreferences _sp;
  DatabaseService() {
    init();
  }
// initialize shared preferences
  init() async {
    _sp = await SharedPreferences.getInstance();
    return _sp;
  }

  //getting data
  getFavourites() async {
    _sp ??= await init();
    return _sp.getString(FAVOURITES_KEY);

    //  {"favourites":"['id1','id2']"};
  }

// storing data
  addToFavourites(int characterID) async {
    //fetching existing list of favourites
    var favoutires = getFavourites();
    print("FAVOURITES IS : $favoutires");
    List<int> initialFavourites;

    if (favoutires != null)
      initialFavourites = List.from(jsonDecode(((getFavourites()))));
    else
      initialFavourites = [];

    initialFavourites.add(characterID);
    await _sp.setString(FAVOURITES_KEY, jsonEncode(initialFavourites));
  }

  bool isPresent(int id) {
    var favoutires = getFavourites();
    List<int> initialFavourites;

    if (favoutires != null)
      initialFavourites = List.from(jsonDecode(((getFavourites()))));
    else
      initialFavourites = [];

    return initialFavourites.contains(id);
  }

  _removeFromFav() async {
    // suru ma latest favourites ko list fetch garne
    // remove id from that list
    // save the list
  }
  removeall() {
    // _sp.clear();
  }
}
