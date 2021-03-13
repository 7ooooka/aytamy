import 'package:aytamy/common/model/User.dart';

/// success : true
/// data : {"name":"fathi","email":"fathi@yahoo.com","type":0,"updated_at":"2021-03-12 15:56:54","created_at":"2021-03-12 15:56:54","id":10}
/// message : "Customers saved successfully"

class SignUpResponse {
  bool _success;
  User _user;
  String _message;

  bool get success => _success;
  User get data => _user;
  String get message => _message;

  SignUpResponse({
      bool success, 
      User data, 
      String message}){
    _success = success;
    _user = data;
    _message = message;
}

  SignUpResponse.fromJson(dynamic json) {
    _success = json["success"];
    _user = json["data"] != null ? User.fromJson(json["data"]) : null;
    _message = json["message"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["success"] = _success;
    if (_user != null) {
      map["data"] = _user.toJson();
    }
    map["message"] = _message;
    return map;
  }

}

