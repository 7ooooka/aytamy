import 'package:shared_preferences/shared_preferences.dart';

String _createdAt;
String _updatedAt;

class PrefManager {
  static const _LOGIN_STATE = "user_login";
  static const _APP_SEEN = "app_seen";
  static const _TOKEN = "user_token";
  static const _USER_ID = "user_id";
  static const _USER_MAIL = "user_mail";
  static const _USER_NAME = "user_name";
  static const _USER_FIRST_NAME = "user_first_name";
  static const _USER_LAST_NAME = "user_last_name";
  static const _USER_PHONE = "user_phone";
  static const _USER_IMAGE = "user_img";
  static const _USER_TYPE = "user_type";
  static const _appLanguage = "app_language";

  static const _BIRTH_DATE = "birth_date";
  static const _COUNTRY_ID = "country_id";
  static const _CITY_ID = "city_id";
  static const _DREAM_ID = "dream_id";
  static const _JOB_ID = "job_id";
  static const _EDUCATION_ID = "education_id";
  static const _NATIONAL_ID = "national_id";
  static const _PERSONAL_ID = "personal_id";
  static const _MOTHER_CERTIFICATE = "mother_certificate";
  static const _FATHER_CERTIFICATE = "father_certificate";
  static const _EDUCATIONAL_CERTIFICATE = "education_certificate";
  static const _PARENT_MOBILE = "parent_mobile";
  static const _WHATS_APP = "whats_App";
  static const _WARRANTY = "warranty";
  static const _GENDER = "gender";
  static const _DESCRIPTION = "description";
  static const _IS_COMPLETED = "is_complete";

// The _internal construction is just a name often given to constructors that are private to the class (the name is not required to be ._internal you can create a private constructor using any Class._someName construction).

  PrefManager._internal();

  static final PrefManager _instance = PrefManager._internal();

  factory PrefManager() {
    return _instance;
  }

  SharedPreferences _prefs;

  Future<bool> setupSharedPreferences() async {
    // _prefs = await SharedPreferences.getInstance();

    _instance._prefs = await SharedPreferences.getInstance();
    return true;
  }

  clearSharedPreferences() async {
    if (_instance._prefs != null) {
      await _prefs.clear();
    }
  }

  setString(String data, String key) async {
    await _prefs.setString(key, data);
  }

  void setUserToken(String data) async {
    await _prefs.setString(_TOKEN, data);
  }

  String getUserToken() {
    return _prefs.getString(_TOKEN) ?? null;
  }

  void setUserId(
    String data,
  ) {
    _prefs.setString(_USER_ID, data);
  }

  void setUserMail(
    String data,
  ) {
    _prefs.setString(_USER_MAIL, data);
  }

  void setUserName(
    String data,
  ) {
    _prefs.setString(_USER_NAME, data);
  }

  void setUserFirstName(
    String data,
  ) {
    _prefs.setString(_USER_FIRST_NAME, data);
  }

  void setUserLastName(
    String data,
  ) {
    _prefs.setString(_USER_LAST_NAME, data);
  }

  void setUserPhone(
    String data,
  ) {
    _prefs.setString(_USER_PHONE, data);
  }

  void setUserProfileImage(
    String data,
  ) {
    _prefs.setString(_USER_IMAGE, data);
  }

  getUserId() {
    return _prefs.getString(_USER_ID) ;
  }

  String getUserMail() {
    return _prefs.getString(_USER_MAIL) ?? '';
  }

  getUserImage() {
    return _prefs.getString(_USER_IMAGE) ?? '';
  }

  String getUserName() {
    return _prefs.getString(_USER_NAME) ?? '';
  }

  String getUserFirstName() {
    return _prefs.getString(_USER_FIRST_NAME) ?? '';
  }

  String getUserLastName() {
    return _prefs.getString(_USER_LAST_NAME) ?? '';
  }

  String getUserPhone() {
    return _prefs.getString(_USER_PHONE);
  }

  String getUserType() {
    return _prefs.getString(_USER_TYPE);
  }

  void setLang(String userData) {
    _prefs.setString(_appLanguage, userData);
  }

  setUserLoginState(bool state) {
    _prefs.setBool(_LOGIN_STATE, state);
  }

  bool isUserLoggedIn() {
    return _prefs.getBool(_LOGIN_STATE) ?? false;
  }

  setAppFirstSeenState(bool state) {
    _prefs.setBool(_APP_SEEN, state);
  }

  serUserType(String type) {
    _prefs.setString(_USER_TYPE, type);
  }

  setBirthDate(String birthDate) {
    _prefs.setString(_BIRTH_DATE, birthDate);
  }

  ////

  setCountryID(String id) {
    _prefs.setString(_COUNTRY_ID, id);
  }

  setCityID(String id) {
    _prefs.setString(_CITY_ID, id);
  }

  setDreamID(String dreamID) {
    _prefs.setString(_DREAM_ID, dreamID);
  }

  setJobID(String jobId) {
    _prefs.setString(_JOB_ID, jobId);
  }

  setEducationId(String eduId) {
    _prefs.setString(_EDUCATION_ID, eduId);
  }

  setEducationCertificate(String cer) {
    _prefs.setString(_EDUCATIONAL_CERTIFICATE, cer);
  }

  setNationalID(String id) {
    _prefs.setString(_NATIONAL_ID, id);
  }

  setPersonalID(String id) {
    _prefs.setString(_PERSONAL_ID, id);
  }

  serFatherCertificate(String cert) {
    _prefs.setString(_FATHER_CERTIFICATE, cert);
  }

  setMotherCertificate(String cert) {
    _prefs.setString(_MOTHER_CERTIFICATE, cert);
  }

  setParentMobile(String num) {
    _prefs.setString(_PARENT_MOBILE, num);
  }

  setGender(String type) {
    _prefs.setString(_GENDER, type);
  }

  setDescription(String desc) {
    _prefs.setString(_DESCRIPTION, desc);
  }

  setCompleteStats(String stats) {
    _prefs.setString(_IS_COMPLETED, stats);
  }

  setWhatsApp(String num) {
    _prefs.setString(_WHATS_APP, num);
  }

  setWarranty(String warranty) {
    _prefs.setString(_WARRANTY, warranty);
  }

  ////

  isAppFirstSeen() {
    return _prefs.getBool(_APP_SEEN);
  }

  String getStringWithKey(String key) {
    return _prefs.getString(key);
  }

  String getLang() {
    String lang = _prefs.getString(_appLanguage);
    return lang;
  }

  ///
  String getCountryID() {
    return _prefs.getString(_COUNTRY_ID);
  }

  String getCityID() {
    return _prefs.getString(_CITY_ID);
  }

  String getDreamID() {
    return _prefs.getString(_DREAM_ID);
  }

  String getJobID() {
    return _prefs.getString(_JOB_ID);
  }

  String getEducationalID() {
    return _prefs.getString(_EDUCATION_ID);
  }

  String getEducationCertificate() {
    return _prefs.getString(_EDUCATIONAL_CERTIFICATE);
  }

  String getNationalID() {
    return _prefs.getString(_NATIONAL_ID);
  }

  String getPersonalID() {
    return _prefs.getString(_PERSONAL_ID);
  }

  String getFatherCertificate() {
    return _prefs.getString(_FATHER_CERTIFICATE);
  }

  String getMotherCertificate() {
    return _prefs.getString(_MOTHER_CERTIFICATE);
  }

  String getParentMobile() {
    return _prefs.getString(_PARENT_MOBILE);
  }

  String getGender() {
    return _prefs.getString(_GENDER);
  }

  String getDescription() {
    return _prefs.getString(_DESCRIPTION);
  }

  String getCompleteStats() {
    return _prefs.getString(_IS_COMPLETED);
  }

  String getWhatsApp() {
    return _prefs.getString(_WHATS_APP);
  }

  String getWarranty() {
    return _prefs.get(_WARRANTY);
  }

  String getBirthDate() {
    return _prefs.getString(_BIRTH_DATE);
  }
}
