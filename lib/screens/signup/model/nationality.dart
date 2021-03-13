
class Nationality {
  int _id;
  String _name;

  int get id => _id;
  String get name => _name;

  Nationality({
    int id,
    String name}){
    _id = id;
    _name = name;
  }

  Nationality.fromJson(dynamic json) {
    _id = json["id"];
    _name = json["name"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["name"] = _name;
    return map;
  }

}