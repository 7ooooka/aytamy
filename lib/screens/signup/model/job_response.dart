import 'job.dart';

class JobResponse {
  bool _success;
  List<Job> _data;
  String _message;

  bool get success => _success;

  List<Job> get data => _data;

  String get message => _message;

  JobResponse({bool success, List<Job> data, String message}) {
    _success = success;
    _data = data;
    _message = message;
  }

  JobResponse.fromJson(dynamic json) {
    _success = json["success"];
    if (json["data"] != null) {
      _data = [];
      json["data"].forEach((v) {
        _data.add(Job.fromJson(v));
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
