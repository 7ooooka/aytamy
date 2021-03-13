import 'nationality.dart';

/// success : true
/// data : [{"id":1,"name":"Egyption"}]
/// message : "Nationalities retrieved successfully"

class NationalityResponse {
  bool _success;
  List<Nationality> _data;
  String _message;

  bool get success => _success;
  List<Nationality> get data => _data;
  String get message => _message;

  NationalityResponse({
      bool success, 
      List<Nationality> data,
      String message}){
    _success = success;
    _data = data;
    _message = message;
}

  NationalityResponse.fromJson(dynamic json) {
    _success = json["success"];
    if (json["data"] != null) {
      _data = [];
      json["data"].forEach((v) {
        _data.add(Nationality.fromJson(v));
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

