class Job {
  int _id;
  String _name;

  int get id => _id;
  String get name => _name;

  Job({
      int id, 
      String name}){
    _id = id;
    _name = name;
}

  Job.fromJson(dynamic json) {
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