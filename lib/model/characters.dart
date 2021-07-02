/// characters : [{"char_id":1,"name":"Walter White","birthday":"09-07-1958","occupation":["High School Chemistry Teacher","Meth King Pin"],"img":"https://images.amcnetworks.com/amc.com/wp-content/uploads/2015/04/cast_bb_700x1000_walter-white-lg.jpg","status":"Presumed dead","nickname":"Heisenberg","appearance":[1,2,3,4,5],"portrayed":"Bryan Cranston","category":"Breaking Bad","better_call_saul_appearance":["sd"]}]

class BadCharacters {
  List<Character> _characters;

  List<Character> get characters => _characters;

  BadCharacters({List<Character> characters}) {
    _characters = characters;
  }

  BadCharacters.fromJson(dynamic json) {
    if (json["characters"] != null) {
      _characters = [];
      json["characters"].forEach((v) {
        _characters.add(Character.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_characters != null) {
      map["characters"] = _characters.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// char_id : 1
/// name : "Walter White"
/// birthday : "09-07-1958"
/// occupation : ["High School Chemistry Teacher","Meth King Pin"]
/// img : "https://images.amcnetworks.com/amc.com/wp-content/uploads/2015/04/cast_bb_700x1000_walter-white-lg.jpg"
/// status : "Presumed dead"
/// nickname : "Heisenberg"
/// appearance : [1,2,3,4,5]
/// portrayed : "Bryan Cranston"
/// category : "Breaking Bad"
/// better_call_saul_appearance : ["sd"]

class Character {
  int _charId;
  String _name;
  String _birthday;
  List<String> _occupation;
  String _img;
  String _status;
  String _nickname;
  List<int> _appearance;
  String _portrayed;
  String _category;
  List<String> _betterCallSaulAppearance;

  int get charId => _charId;
  String get name => _name;
  String get birthday => _birthday;
  List<String> get occupation => _occupation;
  String get img => _img;
  String get status => _status;
  String get nickname => _nickname;
  List<int> get appearance => _appearance;
  String get portrayed => _portrayed;
  String get category => _category;
  List<String> get betterCallSaulAppearance => _betterCallSaulAppearance;

  Character(
      {int charId,
      String name,
      String birthday,
      List<String> occupation,
      String img,
      String status,
      String nickname,
      List<int> appearance,
      String portrayed,
      String category,
      List<String> betterCallSaulAppearance}) {
    _charId = charId;
    _name = name;
    _birthday = birthday;
    _occupation = occupation;
    _img = img;
    _status = status;
    _nickname = nickname;
    _appearance = appearance;
    _portrayed = portrayed;
    _category = category;
    _betterCallSaulAppearance = betterCallSaulAppearance;
  }

  Character.fromJson(dynamic json) {
    _charId = json["char_id"];
    _name = json["name"];
    _birthday = json["birthday"];
    _occupation =
        json["occupation"] != null ? json["occupation"].cast<String>() : [];
    _img = json["img"];
    _status = json["status"];
    _nickname = json["nickname"];
    _appearance =
        json["appearance"] != null ? json["appearance"].cast<int>() : [];
    _portrayed = json["portrayed"];
    _category = json["category"];
    _betterCallSaulAppearance = json["better_call_saul_appearance"] != null
        ? json["better_call_saul_appearance"].cast<String>()
        : [];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["char_id"] = _charId;
    map["name"] = _name;
    map["birthday"] = _birthday;
    map["occupation"] = _occupation;
    map["img"] = _img;
    map["status"] = _status;
    map["nickname"] = _nickname;
    map["appearance"] = _appearance;
    map["portrayed"] = _portrayed;
    map["category"] = _category;
    map["better_call_saul_appearance"] = _betterCallSaulAppearance;
    return map;
  }
}
