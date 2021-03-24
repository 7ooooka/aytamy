import 'package:shared_preferences/shared_preferences.dart';

String _createdAt;
String _updatedAt;

class PrefManager {
  static SharedPreferences _prefs;
  static Future<SharedPreferences> get _instance async =>
      _prefs ??= await SharedPreferences.getInstance();


// call this method from iniState() function of mainApp().
  static Future<bool> init() async {
    _prefs = await _instance;
    return true;
  }

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

  // PrefManager._internal();
  //
  // static final PrefManager _instance = PrefManager._internal();
  //
  // factory PrefManager() {
  //   return _instance;
  // }

  // SharedPreferences _prefs;

  // Future<PrefManager> setupSharedPreferences() async {
  //   // _prefs = await SharedPreferences.getInstance();
  //   _instance._prefs = await SharedPreferences.getInstance();
  //       if(_prefs != null){
  //         print("setupSharedPreferences   ---> true");
  //       }else{
  //         print("setupSharedPreferences   ---> false");
  //       }
  //
  //   return _instance;
  // }

  static clearSharedPreferences() async {
    if (_instance != null) {
      await _prefs.clear();
    }
  }

  static setString(String data, String key) async {
    await _prefs.setString(key, data);
  }

  static void setUserToken(String data) async {
    await _prefs.setString(_TOKEN, data);
  }

  static String  getUserToken() {
    return _prefs.getString(_TOKEN) ?? null;
  }

  static void setUserId(
    String data,
  ) {
    _prefs.setString(_USER_ID, data);
  }

  static void setUserMail(
    String data,
  ) {
    _prefs.setString(_USER_MAIL, data);
  }

  static void setUserName(
    String data,
  ) {
    _prefs.setString(_USER_NAME, data);
  }

  static  void setUserFirstName(
    String data,
  ) {
    _prefs.setString(_USER_FIRST_NAME, data);
  }

  static void setUserLastName(
    String data,
  ) {
    _prefs.setString(_USER_LAST_NAME, data);
  }

  static void setUserPhone(
    String data,
  ) {
    _prefs.setString(_USER_PHONE, data);
  }

  static void setUserProfileImage(
    String data,
  ) {
    _prefs.setString(_USER_IMAGE, data);
  }

  static getUserId() {
    return _prefs.getString(_USER_ID);
  }

  static String getUserMail() {
    return _prefs.getString(_USER_MAIL) ?? '';
  }

  static getUserImage() {
    return _prefs.getString(_USER_IMAGE) ?? '';
  }

  static  String getUserName() {
    return _prefs.getString(_USER_NAME) ?? '';
  }

  static  String getUserFirstName() {
    return _prefs.getString(_USER_FIRST_NAME) ?? '';
  }

  static String getUserLastName() {
    return _prefs.getString(_USER_LAST_NAME) ?? '';
  }

  static String getUserPhone() {
    return _prefs.getString(_USER_PHONE);
  }

  static String getUserType() {
    return _prefs.getString(_USER_TYPE);
  }

  static void setLang(String userData) {
    _prefs.setString(_appLanguage, userData);
  }

  static setUserLoginState(bool state) {
    _prefs.setBool(_LOGIN_STATE, state);
  }

  static bool isUserLoggedIn() {
    return _prefs?.getBool(_LOGIN_STATE) ?? false;
  }

  static setAppFirstSeenState(bool state) {
    _prefs.setBool(_APP_SEEN, state);
  }

  static serUserType(String type) {
    _prefs.setString(_USER_TYPE, type);
  }

  static setBirthDate(String birthDate) {
    _prefs.setString(_BIRTH_DATE, birthDate);
  }

  ////

  static setCountryID(String id) {
    _prefs.setString(_COUNTRY_ID, id);
  }

  static setCityID(String id) {
    _prefs.setString(_CITY_ID, id);
  }

  static setDreamID(String dreamID) {
    _prefs.setString(_DREAM_ID, dreamID);
  }

  static setJobID(String jobId) {
    _prefs.setString(_JOB_ID, jobId);
  }

  static setEducationId(String eduId) {
    _prefs.setString(_EDUCATION_ID, eduId);
  }

  static  setEducationCertificate(String cer) {
    _prefs.setString(_EDUCATIONAL_CERTIFICATE, cer);
  }

  static setNationalID(String id) {
    _prefs.setString(_NATIONAL_ID, id);
  }

  static setPersonalID(String id) {
    _prefs.setString(_PERSONAL_ID, id);
  }

  static serFatherCertificate(String cert) {
    _prefs.setString(_FATHER_CERTIFICATE, cert);
  }

  static setMotherCertificate(String cert) {
    _prefs.setString(_MOTHER_CERTIFICATE, cert);
  }

  static  setParentMobile(String num) {
    _prefs.setString(_PARENT_MOBILE, num);
  }

  static setGender(String type) {
    _prefs.setString(_GENDER, type);
  }

  static  setDescription(String desc) {
    _prefs.setString(_DESCRIPTION, desc);
  }

  static  setCompleteStats(String stats) {
    _prefs.setString(_IS_COMPLETED, stats);
  }

  static setWhatsApp(String num) {
    _prefs.setString(_WHATS_APP, num);
  }

  static setWarranty(String warranty) {
    _prefs.setString(_WARRANTY, warranty);
  }

  ////

  static isAppFirstSeen() {
    return _prefs.getBool(_APP_SEEN);
  }

  static String getStringWithKey(String key) {
    return _prefs.getString(key);
  }

  static String getLang() {
    String lang = _prefs.getString(_appLanguage);
    return lang;
  }

  ///
  static String getCountryID() {
    return _prefs.getString(_COUNTRY_ID);
  }

  static  String getCityID() {
    return _prefs.getString(_CITY_ID);
  }

  static  String getDreamID() {
    return _prefs.getString(_DREAM_ID);
  }

  static  String getJobID() {
    return _prefs.getString(_JOB_ID);
  }

  static String getEducationalID() {
    return _prefs.getString(_EDUCATION_ID);
  }

  static  String getEducationCertificate() {
    return _prefs.getString(_EDUCATIONAL_CERTIFICATE);
  }

  static String getNationalID() {
    return _prefs.getString(_NATIONAL_ID);
  }

  static String getPersonalID() {
    return _prefs.getString(_PERSONAL_ID);
  }

  static String getFatherCertificate() {
    return _prefs.getString(_FATHER_CERTIFICATE);
  }

  static String getMotherCertificate() {
    return _prefs.getString(_MOTHER_CERTIFICATE);
  }

  static String getParentMobile() {
    return _prefs.getString(_PARENT_MOBILE);
  }

  static String getGender() {
    return _prefs.getString(_GENDER);
  }

  static String getDescription() {
    return _prefs.getString(_DESCRIPTION);
  }

  static  String getCompleteStats() {
    return _prefs.getString(_IS_COMPLETED);
  }

  static String getWhatsApp() {
    return _prefs.getString(_WHATS_APP);
  }

  static String getWarranty() {
    return _prefs.get(_WARRANTY);
  }

  static String getBirthDate() {
    return _prefs.getString(_BIRTH_DATE);
  }
}
