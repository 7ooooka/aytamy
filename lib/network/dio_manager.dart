import 'package:aytamy/common/model/ErrorResponse.dart';
import 'package:aytamy/common/tools.dart';
import 'package:aytamy/generated/l10n.dart';
import 'package:aytamy/storage/pref_manager.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class DIOManager {
  static final DIOManager _instance = DIOManager._dio();

  factory DIOManager() => _instance;

  DIOManager._dio();

  Dio get _dio {
    final Dio dio = Dio();

    dio.options.baseUrl = "http://aytamapp.com/public/index.php/api";
    dio.options.headers = {
      "Accept-Language": currentLanguage,
    };
    print("Header AcceptedLanguage --- >" + currentLanguage.toString());
    if (PrefManager().getUserToken() != null) {
      dio.options.headers = {
        "Authorization": "${PrefManager().getUserToken()}",
        "email": "${PrefManager().getUserMail()}",
      };
    }
    print(dio.options.headers.toString());
    return dio;
  }

  static const ERROR_CODE_UN_REACHABLE = "4";

  static const String _USER_LOGIN = "/login";
  static const String _USER_FORGOT_PASSWORD_MAIL = "/auth/reset-password";
  static const String _USER_SIGN_UP_MAIL = "/customers";
  static const String _UPDATE_USER_DATA = "/customers";

  static const String GET_JOBS = "/jobs";
  static const String GET_NATIONALITY = "/nationalities";
  static const String GET_CITIES = "/countries";
  static const String BEING_BAILED_USERS = "/get_warranty_cases";
  static const String SEARCH_USERS = "/search";
  static const String GET_REGION = "/region/find-all-by-city-id";
  static const String MOST_RECENT_USERS = "/get_new_cases";
  static const String SOCIAL_USER_SIGN_in = "/save_social_media";
  sendLoginRequest(
      {Function onSuccess,
      Function onError,
      String email,
      String password}) async {
    var bodyParameter;

    bodyParameter = {"email": email.trim(), "password": password};
    _sendPostRequest(
      onSuccess: onSuccess,
      onError: onError,
      url: _USER_LOGIN,
      bodyParameters: bodyParameter,
    );
  }

  sendForgotPasswordMailRequest(
      {Function onSuccess, Function onError, type, String userName}) {
    print("sendForgotPasswordMailRequest ---> $userName");
    var bodyParameter = {"email": userName};
    _sendGetRequest(
        onSuccess: onSuccess,
        onError: onError,
        url: _USER_FORGOT_PASSWORD_MAIL,
        queryParameters: bodyParameter);
  }

  createUser({
    Function onSuccess,
    Function onError,
    type,
    @required String password,
    @required String userName,
    @required String mail,
  }) {
    var bodyParameter;
    var url;

    url = _USER_SIGN_UP_MAIL;

    bodyParameter = {
      "name": userName,
      "password": password,
      "type": type,
      "email": mail
    };
    _sendPostRequest(
      onSuccess: onSuccess,
      onError: onError,
      url: url,
      bodyParameters: bodyParameter,
    );
  }

  createSocialUser({
    Function onSuccess,
    Function onError,
    type,
    @required String social_id,
    @required String social_token,
    @required String social_type,
    @required String userName,
    @required String mail,
    @required String imageUrl,
  }) {
    var bodyParameter;
    var url;

    url = SOCIAL_USER_SIGN_in;

    bodyParameter = {
      "name": userName,
      "social_id": social_id,
      "social_token": social_token,
      "social_type": social_type,
      "type": type,
      "email": mail,
      // "image":imageUrl
    };
    _sendPostRequest(
      onSuccess: onSuccess,
      onError: onError,
      url: url,
      bodyParameters: bodyParameter,
    );
  }

  getJobs({Function onSuccess, Function onError}) {
    _sendGetRequest(
      onSuccess: onSuccess,
      onError: onError,
      url: GET_JOBS,
    );
  }

  getCities({Function onSuccess, Function onError}) {
    _sendGetRequest(
      onSuccess: onSuccess,
      onError: onError,
      url: GET_CITIES,
    );
  }

  getMostRecentUsers({Function onSuccess, Function onError}) {
    _sendGetRequest(
      onSuccess: onSuccess,
      onError: onError,
      url: MOST_RECENT_USERS,
    );
  }
  getBeingBailedUsers({Function onSuccess, Function onError}) {
    _sendGetRequest(
      onSuccess: onSuccess,
      onError: onError,
      url: BEING_BAILED_USERS,
    );
  }
  getSearchUsers(String value,{Function onSuccess, Function onError}) {
    _sendGetRequest(
      onSuccess: onSuccess,
      onError: onError,
      url: SEARCH_USERS + "/$value",
    );
  }
  getNationalities({Function onSuccess, Function onError}) {
    _sendGetRequest(
      onSuccess: onSuccess,
      onError: onError,
      url: GET_NATIONALITY,
    );
  }

  getCitiesRegion({Function onSuccess, Function onError, cityId}) {
    _sendGetRequest(
        onSuccess: onSuccess,
        onError: onError,
        url: GET_REGION,
        queryParameters: {"city-id": cityId});
  }

  updateUsergender({uid,String gender, Function onSuccess, Function onError}) {
    FormData formData = FormData.fromMap({
      "gender": gender,
    });
    _sendFormDataRequest(
      onSuccess: onSuccess,
      onError: onError,
      bodyParameters: formData,
      url: _UPDATE_USER_DATA + "/$uid",
    );
  }
  updateUserwarranty({uid,int warranty, Function onSuccess, Function onError}) {
    FormData formData = FormData.fromMap({
      "warranty": warranty,
    });
    _sendFormDataRequest(
      onSuccess: onSuccess,
      onError: onError,
      bodyParameters: formData,
      url: _UPDATE_USER_DATA + "/$uid",
    );
  }

  updateUserInfo(
      {Map data,
      uid,
      type,
      dateBirth,
      countryId,
      jobId,
      nationalityId,
      profileImgPath,
      profileImgName,
      Function onSuccess,
      Function onError}) async {
    MultipartFile file =
        await MultipartFile.fromFile(profileImgPath, filename: profileImgName);

    // FormData formData = FormData.fromMap({
    //   "image": await MultipartFile.fromFile(
    //     profileImgPath,
    //     filename: profileImgName, //add this
    //   ),
    // });

    FormData formData = FormData.fromMap({
      "type": type,
      "date_birth": dateBirth,
      "country_id": countryId,
      "job_id": jobId,
      "nationality_id": nationalityId,
      "image": await MultipartFile.fromFile(
        profileImgPath,
        filename: profileImgName, //add this
      ),
    });
    _sendFormDataRequest(
      onSuccess: onSuccess,
      onError: onError,
      bodyParameters: formData,
      filePath: profileImgPath,
      fileName: profileImgName,
      url: _UPDATE_USER_DATA + "/$uid",
    );
  }

  _sendGetRequest(
      {Function onSuccess,
      Function onError,
      String url,
      queryParameters}) async {
    try {
      Response response;
      if (queryParameters == null) {
        response = await _dio.get("/$url");
      } else {
        response = await _dio.get("/$url", queryParameters: queryParameters);
      }
      if (response.statusCode == 200) {
        logger.e(
            "_sendGetRequest onSuccess----> Of Url ${response.request.uri.toString()} " +
                response.toString());
        onSuccess(response.data);
      } else {
        print(
            "_sendGetRequest onError----> Of Url $url " + response.toString());
        onError(response);
      }
    } on DioError catch (e) {
      handleDioErrorResponse(url, e, onError);
    }
  }

  _sendDeleteRequest(
      {Function onSuccess(data),
      Function onError(data),
      String url,
      queryParameters,
      bodyParameters}) async {
    try {
      Response response;
      if (queryParameters != null && bodyParameters == null) {
        print("_sendDeleteRequest onSuccess called [1]");
        response = await _dio.delete(url, queryParameters: queryParameters);
      } else if (queryParameters != null && bodyParameters != null) {
        print("_sendDeleteRequest onSuccess called [2]");
        response = await _dio.delete(url,
            data: bodyParameters, queryParameters: queryParameters);
      } else {
        print("_sendDeleteRequest onSuccess called [3]");
        response = await _dio.delete(url, data: bodyParameters);
      }

      if (response.statusCode == 200) {
        logger.e("_sendDeleteRequest onSuccess----> Of Url $url " +
            response.toString());
        if (response.data != null) {
          onSuccess(response.data);
        } else {
          onSuccess("Success");
        }
      } else {
        logger.e("_sendDeleteRequest onError----> Of Url $url " +
            response.toString());
        onError(response);
      }
    } on DioError catch (e) {
      handleDioErrorResponse(url, e, onError);
    }
  }

  _sendPostRequest(
      {Function onSuccess(data),
      Function onError(data),
      String url,
      queryParameters,
      bodyParameters}) async {
    print("submitNewAddress ----> " + bodyParameters.toString());
    try {
      Response response;
      if (queryParameters != null && bodyParameters == null) {
        print("_sendPostRequest onSuccess called [1]");
        response = await _dio.post(url, queryParameters: queryParameters);
      } else if (queryParameters != null && bodyParameters != null) {
        print("_sendPostRequest onSuccess called [2]");
        response = await _dio.post(url,
            data: bodyParameters, queryParameters: queryParameters);
      } else {
        print("_sendPostRequest onSuccess called [3]");
        response = await _dio.post(url, data: bodyParameters);
      }

      if (response.statusCode == 200) {
        logger.e("_sendPostRequest onSuccess----> Of Url $url " +
            response.toString());
        if (response.data != null) {
          onSuccess(response.data);
        } else {
          onSuccess("Success");
        }
      } else {
        logger.e(
            "_sendPostRequest onError----> Of Url $url " + response.toString());
        onError(response);
      }
    } on DioError catch (e) {
      handleDioErrorResponse(url, e, onError);
    }
  }

  _sendFormDataRequest(
      {Function onSuccess(data),
      Function onError(data),
      String url,
      String filePath,
      String fileName,
      queryParameters,
      FormData bodyParameters}) async {
    print("_sendFormDataRequest ----> " + bodyParameters.fields.toString());
    print("_sendFormDataRequest Files----> " + bodyParameters.files.toString());
    try {
      Response response;
      if (queryParameters != null && bodyParameters == null) {
        print("_sendFormDataRequest onSuccess called [1]");

        response = await _dio.post(url,
            queryParameters: queryParameters, data: bodyParameters);
      } else if (queryParameters != null && bodyParameters != null) {
        print("_sendFormDataRequest onSuccess called [2]");

        response = await _dio.post(url,
            data: bodyParameters, queryParameters: queryParameters);
      } else {
        print("_sendFormDataRequest onSuccess called [3]");

        response = await _dio.post(
          url,
          data: bodyParameters,
        );
      }

      if (response.statusCode == 200) {
        logger.e("_sendPostRequest onSuccess----> Of Url $url " +
            response.toString());
        if (response.data != null) {
          onSuccess(response.data);
        } else {
          onSuccess("Success");
        }
      } else {
        logger.e(
            "_sendPostRequest onError----> Of Url $url " + response.toString());
        onError(response);
      }
    } on DioError catch (e) {
      handleDioErrorResponse(url, e, onError);
    }
  }

  _sendPutRequest(
      {Function onSuccess(data),
      Function onError(data),
      String url,
      queryParameters,
      bodyParameters}) async {
    print("bodyParameters --->" + bodyParameters.toString());
    try {
      Response response;
      if (queryParameters != null && bodyParameters == null) {
        response = await _dio.put(url, queryParameters: queryParameters);
      } else if (queryParameters != null && bodyParameters != null) {
        response = await _dio.put(url,
            data: bodyParameters, queryParameters: queryParameters);
      } else {
        response = await _dio.put(url, data: bodyParameters);
      }

      if (response.statusCode == 200) {
        logger.e("_sendPostRequest onSuccess----> Of Url $url " +
            response.toString());
        if (response.data != null) {
          onSuccess(response.data);
        } else {
          onSuccess("Success");
        }
      } else {
        logger.e(
            "_sendPutRequest onError----> Of Url $url " + response.toString());
        onError(response);
      }
    } on DioError catch (e) {
      handleDioErrorResponse(url, e, onError);
    }
  }

  handleDioErrorResponse(url, DioError e, onError) {
    ErrorResponse errorResponse;
    try {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.

      if (e.response != null) {
        print("handleDioErrorResponse() ---> Bad Response (" +
            e?.response?.request?.uri.toString() +
            ")(" +
            e?.response?.statusCode?.toString() +
            ")");

        if (e?.response?.statusCode == 500) {
          onError("Un Expected Error");
        } else if (e?.response?.statusCode == 406) {
          errorResponse = ErrorResponse.fromJson(e.response.data);
          onError(errorResponse.errors[0].message);
        } else if (e?.response?.statusCode == 401) {
          onError(S.current.invalidLogin);
        } else {
          onError(S.current.noResultFound);
        }
      } else {
        print("NetworkError ---> " + e?.response.toString());
        onError(e?.response ?? "UnExpected Error");
      }
    } catch (e) {
      print("NetworkError ---> " + e?.response.toString());
      onError("[3] Un Expected Error");
    }
  }
}

// class ErrorResponse {
//   String fixJidErrorDetails;
//   String fixJidErrorCode;
//
//   ErrorResponse({this.fixJidErrorDetails, this.fixJidErrorCode});
//
//   factory ErrorResponse.fromJson(Map<String, dynamic> json) {
//     try {
//       return ErrorResponse(
//           fixJidErrorDetails: json['optique_error_details'][0],
//           fixJidErrorCode: json['optique_error_code'][0]);
//     } catch (e) {
//       return ErrorResponse(
//           fixJidErrorDetails: "Un parsed Error", fixJidErrorCode: "0");
//     }
//   }
// }
