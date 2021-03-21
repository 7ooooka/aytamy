import 'package:aytamy/common/model/User.dart';

/// success : true
/// data : [{"id":12,"name":"fathi2","email":"fathi2@yahoo.com","image":null,"country_id":null,"dream_id":null,"job_id":null,"city_id":null,"education_id":null,"nationality_id":null,"date_birth":null,"personal_id":null,"mother_certificate":null,"father_certificate":null,"education_certificate":null,"whats_app":null,"parent_mobile":null,"warranty":null,"gender":null,"type":0,"description":null,"is_complete":null,"is_warranty":0,"created_at":"2021-03-13 17:02:36","updated_at":"2021-03-13 17:02:36","age":"0"},{"id":11,"name":"fathi","email":"fathi@yahoo.com","image":null,"country_id":null,"dream_id":null,"job_id":null,"city_id":null,"education_id":null,"nationality_id":null,"date_birth":null,"personal_id":null,"mother_certificate":null,"father_certificate":null,"education_certificate":null,"whats_app":null,"parent_mobile":null,"warranty":null,"gender":null,"type":0,"description":null,"is_complete":null,"is_warranty":0,"created_at":"2021-03-13 17:02:23","updated_at":"2021-03-13 17:02:23","age":"0"},{"id":7,"name":"fathi6","email":"fathi6@yahoo.com","image":null,"country_id":1,"dream_id":null,"job_id":1,"city_id":1,"education_id":null,"nationality_id":null,"date_birth":"2012-08-28 00:00:00","personal_id":"images/customers/YjlVjB_1605826527-(1).PNG","mother_certificate":null,"father_certificate":null,"education_certificate":"images/customers/YRLukg_1605827520-(1).PNG","whats_app":11111111,"parent_mobile":1114855,"warranty":0,"gender":"female","type":0,"description":null,"is_complete":1,"is_warranty":0,"created_at":"2021-02-27 13:23:15","updated_at":"2021-03-12 22:11:58","age":"8"},{"id":10,"name":"fathi","email":"fathi@yahoo.com","image":null,"country_id":null,"dream_id":null,"job_id":null,"city_id":null,"education_id":null,"nationality_id":null,"date_birth":null,"personal_id":null,"mother_certificate":null,"father_certificate":null,"education_certificate":null,"whats_app":null,"parent_mobile":null,"warranty":null,"gender":null,"type":0,"description":null,"is_complete":null,"is_warranty":0,"created_at":"2021-03-12 15:56:54","updated_at":"2021-03-12 15:56:54","age":"0"},{"id":9,"name":"jejfjrjf","email":"jdjeiejeueurur","image":null,"country_id":null,"dream_id":null,"job_id":null,"city_id":null,"education_id":null,"nationality_id":null,"date_birth":null,"personal_id":null,"mother_certificate":null,"father_certificate":null,"education_certificate":null,"whats_app":null,"parent_mobile":null,"warranty":null,"gender":null,"type":0,"description":null,"is_complete":null,"is_warranty":0,"created_at":"2021-03-12 15:53:10","updated_at":"2021-03-12 15:53:10","age":"0"},{"id":8,"name":"fathi2","email":"fathi2@yahoo.com","image":null,"country_id":null,"dream_id":null,"job_id":null,"city_id":null,"education_id":null,"nationality_id":null,"date_birth":null,"personal_id":null,"mother_certificate":null,"father_certificate":null,"education_certificate":null,"whats_app":null,"parent_mobile":null,"warranty":null,"gender":null,"type":0,"description":null,"is_complete":null,"is_warranty":0,"created_at":"2021-03-09 23:19:58","updated_at":"2021-03-09 23:19:58","age":"0"}]
/// message : "Customers retrieved successfully"

class Response {
  bool _success;
  List<User> _data;
  String _message;

  bool get success => _success;

  List<User> get data => _data;

  String get message => _message;

  Response({bool success, List<User> data, String message}) {
    _success = success;
    _data = data;
    _message = message;
  }

  Response.fromJson(dynamic json) {
    _success = json["success"];
    if (json["data"] != null) {
      _data = [];
      json["data"].forEach((v) {
        _data.add(User.fromJson(v));
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
