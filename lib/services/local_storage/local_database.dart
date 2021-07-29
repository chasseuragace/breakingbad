//local database ma CRUD garna API manager jastqai class banaune

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DatabaseService {
  ValueNotifier<bool> isLoading = ValueNotifier(true);

  setLoading() {
    isLoading.value = true;
  }

  setLoaded() {
    isLoading.value = false;
  }

  static const String FAVOURITES_KEY = "favourites";

  SharedPreferences _sp;
  DatabaseService() {
    init();
  }
// initialize shared preferences
  init() async {
    SharedPreferences.getInstance().then((value) {
      _sp = value;
    });
    setLoaded();
  }

  //getting data
  List<int> getFavourites() {
    var favoutires = _sp.getString(FAVOURITES_KEY);
    List<int> initialFavourites =
        (favoutires != null) ? List.from(jsonDecode(favoutires)) : <int>[];
    return initialFavourites;
    //  {"favourites":"['id1','id2']"};
  }

// storing data
  addToFavourites(int characterID) async {
    setLoading();
    //fetching existing list of favourites
    var favoutires = getFavourites();
    favoutires.add(characterID);
    await _sp.setString(FAVOURITES_KEY, jsonEncode(favoutires));
    setLoaded();
  }

  bool isPresent(int id) {
    return getFavourites().contains(id);
  }

  _removeFromFav(int id) async {
    setLoading();
    var favourtires = getFavourites();
    favourtires.remove(id);
    await _sp.setString(FAVOURITES_KEY, jsonEncode(favourtires));
    setLoaded();
  }

  addRemoveFromFavourites(int id) async {
    return isPresent(id) ? _removeFromFav(id) : addToFavourites(id);
  }
}
