import 'dart:io';

import 'package:aytamy/common/model/User.dart';
import 'package:aytamy/network/dio_manager.dart';
import 'package:aytamy/screens/signup/model/city_response.dart';
import 'package:aytamy/screens/signup/model/job_response.dart';
import 'package:aytamy/screens/signup/model/nationality_response.dart';
import 'package:aytamy/screens/signup/model/sign_up_response.dart';
import 'package:aytamy/storage/pref_manager.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class RegistrationModel {
  signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
    await googleUser.authentication;
  }

  signInWithFacebook() async {
    // Trigger the sign-in flow
    var result = await FacebookAuth.instance.login();
  }

  signUpUser({String userName, email, password, onSuccess, onError}) {
    print("userName: $userName + email : $email + password : $password");
    DIOManager().createUser(
        type: "0",
        userName: userName,
        mail: email,
        password: password,
        onSuccess: (response) {
          print("signUpUser onSuccess ---->" + response.toString());
          SignUpResponse signUpResponse = SignUpResponse.fromJson(response);
          // _saveUserData(signUpResponse.data);
          onSuccess();
        },
        onError: (error) {
          onError(error.toString());
          print("signUpUser onError ---->" + error.toString());
        });
  }

  loginUser({email, password, onSuccess, onError}) {
    print("email : $email + password : $password");
    DIOManager().sendLoginRequest(
        email: email,
        password: password,
        onSuccess: (response) {
          print("login onSuccess ---->" + response.toString());
          SignUpResponse signUpResponse = SignUpResponse.fromJson(response);
          _saveUserData(signUpResponse.data);
          onSuccess();
        },
        onError: (error) {
          onError(error.toString());
          print("login onError ---->" + error.toString());
        });
  }

  getJobs({onSuccess, onError}) {
    DIOManager().getJobs(onSuccess: (response) {
      print("getJobs onSuccess ---->" + response.toString());
      JobResponse jobResponse = JobResponse.fromJson(response);
      onSuccess(jobResponse.data);
    }, onError: (error) {
      onError(error.toString());
      print("getJobs onError ---->" + error.toString());
    });
  }

  getCities({onSuccess, onError}) {
    DIOManager().getCities(onSuccess: (response) {
      print("getCities onSuccess ---->" + response.toString());
      CityResponse cityResponse = CityResponse.fromJson(response);
      onSuccess(cityResponse.data);
    }, onError: (error) {
      onError(error.toString());
      print("getCities onError ---->" + error.toString());
    });
  }

  getNationalities({onSuccess, onError}) {
    DIOManager().getCities(onSuccess: (response) {
      print("getNationalities onSuccess ---->" + response.toString());
      NationalityResponse nationalityResponse =
      NationalityResponse.fromJson(response);
      onSuccess(nationalityResponse.data);
    }, onError: (error) {
      onError(error.toString());
      print("getNationalities onError ---->" + error.toString());
    });
  }

  updateUserData({File profileImagePath,
    birthDate,
    jobId,
    nationalityId,
    countryID,
    onSuccess,
    onError}) {
    Map data = {
      "type": PrefManager().getUserType() ?? "0",
      "date_birth": birthDate ?? PrefManager().getBirthDate(),
      "country_id": countryID ?? PrefManager().getCountryID(),
      "job_id": jobId ?? PrefManager().getJobID(),
      "nationality_id": nationalityId ?? PrefManager().getNationalID()
    };

    var path = profileImagePath.path.toString();
    var name = profileImagePath.path
        .split('/')
        .last;

    DIOManager().updateUserInfo(
        uid: PrefManager().getUserId() ?? "7",
        profileImgPath: path,
        profileImgName: name,
        type: PrefManager().getUserType() ?? "0",
        dateBirth: birthDate ?? PrefManager().getBirthDate(),
        countryId: countryID ?? PrefManager().getCountryID(),
        jobId: jobId ?? PrefManager().getJobID(),
        nationalityId: nationalityId ?? PrefManager().getNationalID(),
        onSuccess: (response)
    {
      SignUpResponse signUpResponse = SignUpResponse.fromJson(response);
      _saveUserData(signUpResponse.data);

      print("updateUserData onSuccess ---->" + response.toString());
      onSuccess();
    },
    onError: (error) {
    onError(error.toString());
    print("updateUserData onError ---->" + error.toString());
    });
  }

  _saveUserData(User user) {
    PrefManager().setUserId(user.id.toString());
    PrefManager().setUserMail(user.email);
    PrefManager().setUserName(user.name);
    PrefManager().serUserType(user.type.toString());
    PrefManager().setCityID(user.cityId.toString());
    PrefManager().setCountryID(user.countryId.toString());
    PrefManager().setDreamID(user.dreamId.toString());
    PrefManager().setJobID(user.jobId.toString());
    PrefManager().setEducationId(user.educationId.toString());
    PrefManager().setEducationCertificate(user.educationCertificate.toString());
    PrefManager().setNationalID(user.nationalityId.toString());
    PrefManager().setPersonalID(user.personalId.toString());
    PrefManager().serFatherCertificate(user.fatherCertificate.toString());
    PrefManager().setMotherCertificate(user.motherCertificate.toString());
    PrefManager().setParentMobile(user.parentMobile.toString());
    PrefManager().setGender(user.gender.toString());
    PrefManager().setDescription(user.description.toString());
    PrefManager().setWhatsApp(user.whatsApp.toString());
    PrefManager().setWarranty(user.warranty.toString());
  }
}
