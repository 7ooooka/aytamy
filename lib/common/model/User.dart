class User {
  User();
  int _id;
  String _name;
  String _email;
  dynamic _image;
  int _countryId;
  dynamic _dreamId;
  int _jobId;
  int _cityId;
  dynamic _educationId;
  dynamic _nationalityId;
  String _dateBirth;
  String _personalId;
  dynamic _motherCertificate;
  dynamic _fatherCertificate;
  String _educationCertificate;
  int _whatsApp;
  int _parentMobile;
  int _warranty;
  String _gender;
  int _type;
  dynamic _description;
  int _isComplete;
  int _isWarranty;
  String _createdAt;
  String _updatedAt;

  int get id => _id;

  String get name => _name;

  String get email => _email;

  dynamic get image => _image;

  int get countryId => _countryId;

  dynamic get dreamId => _dreamId;

  int get jobId => _jobId;

  int get cityId => _cityId;

  dynamic get educationId => _educationId;

  dynamic get nationalityId => _nationalityId;

  String get dateBirth => _dateBirth;

  String get personalId => _personalId;

  dynamic get motherCertificate => _motherCertificate;

  dynamic get fatherCertificate => _fatherCertificate;

  String get educationCertificate => _educationCertificate;

  int get whatsApp => _whatsApp;

  int get parentMobile => _parentMobile;

  int get warranty => _warranty;

  String get gender => _gender;

  int get type => _type;

  dynamic get description => _description;

  int get isComplete => _isComplete;

  int get isWarranty => _isWarranty;

  String get createdAt => _createdAt;

  String get updatedAt => _updatedAt;

  Res(
      {int id,
      String name,
      String email,
      dynamic image,
      int countryId,
      dynamic dreamId,
      int jobId,
      int cityId,
      dynamic educationId,
      dynamic nationalityId,
      String dateBirth,
      String personalId,
      dynamic motherCertificate,
      dynamic fatherCertificate,
      String educationCertificate,
      int whatsApp,
      int parentMobile,
      int warranty,
      String gender,
      int type,
      dynamic description,
      int isComplete,
      int isWarranty,
      String createdAt,
      String updatedAt}) {
    _id = id;
    _name = name;
    _email = email;
    _image = image;
    _countryId = countryId;
    _dreamId = dreamId;
    _jobId = jobId;
    _cityId = cityId;
    _educationId = educationId;
    _nationalityId = nationalityId;
    _dateBirth = dateBirth;
    _personalId = personalId;
    _motherCertificate = motherCertificate;
    _fatherCertificate = fatherCertificate;
    _educationCertificate = educationCertificate;
    _whatsApp = whatsApp;
    _parentMobile = parentMobile;
    _warranty = warranty;
    _gender = gender;
    _type = type;
    _description = description;
    _isComplete = isComplete;
    _isWarranty = isWarranty;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  User.fromJson(dynamic json) {
    _id = json["id"];
    _name = json["name"];
    _email = json["email"];
    _image = json["image"];
    _countryId = json["country_id"];
    _dreamId = json["dream_id"];
    _jobId = json["job_id"];
    _cityId = json["city_id"];
    _educationId = json["education_id"];
    _nationalityId = json["nationality_id"];
    _dateBirth = json["date_birth"];
    _personalId = json["personal_id"];
    _motherCertificate = json["mother_certificate"];
    _fatherCertificate = json["father_certificate"];
    _educationCertificate = json["education_certificate"];
    _whatsApp = json["whats_app"];
    _parentMobile = json["parent_mobile"];
    _warranty = json["warranty"];
    _gender = json["gender"];
    _type = json["type"];
    _description = json["description"];
    _isComplete = json["is_complete"];
    _isWarranty = json["is_warranty"];
    _createdAt = json["created_at"];
    _updatedAt = json["updated_at"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["name"] = _name;
    map["email"] = _email;
    map["image"] = _image;
    map["country_id"] = _countryId;
    map["dream_id"] = _dreamId;
    map["job_id"] = _jobId;
    map["city_id"] = _cityId;
    map["education_id"] = _educationId;
    map["nationality_id"] = _nationalityId;
    map["date_birth"] = _dateBirth;
    map["personal_id"] = _personalId;
    map["mother_certificate"] = _motherCertificate;
    map["father_certificate"] = _fatherCertificate;
    map["education_certificate"] = _educationCertificate;
    map["whats_app"] = _whatsApp;
    map["parent_mobile"] = _parentMobile;
    map["warranty"] = _warranty;
    map["gender"] = _gender;
    map["type"] = _type;
    map["description"] = _description;
    map["is_complete"] = _isComplete;
    map["is_warranty"] = _isWarranty;
    map["created_at"] = _createdAt;
    map["updated_at"] = _updatedAt;
    return map;
  }
}
