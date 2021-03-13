import 'city.dart';

/// success : true
/// data : [{"id":1,"name":"Egypt"}]
/// message : "Countries retrieved successfully"

class CityResponse {
  bool _success;
  List<City> _data;
  String _message;

  bool get success => _success;

  List<City> get data => _data;

  String get message => _message;

  CityResponse({bool success, List<City> data, String message}) {
    _success = success;
    _data = data;
    _message = message;
  }

  CityResponse.fromJson(dynamic json) {
    _success = json["success"];
    if (json["data"] != null) {
      _data = [];
      json["data"].forEach((v) {
        _data.add(City.fromJson(v));
      });
    }
    _message = json["message"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["success"] = _success;
    if (_data != null) {
      map["data"] = _data.map((v) => v.toJson()).toList();
    }
    map["message"] = _message;
    return map;
  }
}
