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

import '../../../app/app_model.dart';

class RegistrationModel {
  final _app = AppModel();
  GoogleSignIn googleSignIn = new GoogleSignIn();

  signInWithGoogle({onSucces, onError}) async {
    googleSignIn.signOut();
    var userData;
    bool isSigned;
    String accessToken;
    try {
      isSigned = await googleSignIn.isSignedIn();

      /*     if (isSigned) {
         GoogleSignInAccount googleUser =await  googleSignIn.currentUser;
        print("Goolgle request ----> is Logged:::: ${(googleUser.displayName.toString())}");
        // now you can call to  FacebookAuth.instance.getUserData();
         final GoogleSignInAuthentication googleAuth =
         await googleUser.authentication;
         accessToken =  googleAuth.accessToken;
         onSucces();
      } else {*/
      GoogleSignInAccount googleUser = await googleSignIn.signIn();
      print(
          "Goolgle request ----> is Logged:::: ${(googleUser.displayName.toString())}");
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      accessToken = googleAuth.accessToken;
      signUpSocialUser(
          social_type: "google",
          social_token: accessToken,
          social_id: googleUser.id,
          userName: googleUser.displayName,
          email: googleUser.email,
          imageUrl: googleUser.photoUrl.toString(),
          onSuccess: onSucces,
          onError: (error) {
            onError(error.toString());
            print("signUpUser onError ---->" + error.toString());
          });
      // _app.setUserId(googleUser.id);
      // _app.setUserName(googleUser.displayName);
      // _app.setUserToken(accessToken);
      // _app.setUserMail(googleUser.email);
      // _app.setUserProfileImage(googleUser.photoUrl);
      // onSucces();
      // }
    } catch (e) {
      print("erroror" + e.toString());
      onError(e.toString()); // print the error message in console
    }
  }

  // signInWithFacebook() async {
  //   // Trigger the sign-in flow
  //   var result = await FacebookAuth.instance.login();
  // }

  signInWithFacebook({onSucces, onError}) async {
    var userData;
    AccessToken accessToken;
    try {
      accessToken = await FacebookAuth.instance.isLogged;

      if (accessToken != null) {
        print("FaceBook request ----> is Logged:::: ${(accessToken.toJson())}");
        // now you can call to  FacebookAuth.instance.getUserData();
        Map<String, dynamic> userData =
            await FacebookAuth.instance.getUserData();
        accessToken = accessToken;
        // signUpSocialUser(
        //     social_type: "facebook",
        //     social_token: accessToken.token,
        //     social_id: userData['id'],
        //     userName: userData['name'],
        //     email: userData['email'],
        //     imageUrl: userData['picture']['data']['url'].toString(),
        //     onSuccess: onSucces,
        //     onError: (error) {
        //       onError(error.toString());
        //       print("signUpUser onError ---->" + error.toString());
        //     });
        PrefManager.setUserId(userData['id'].toString());
        PrefManager.setUserMail(userData['email']);
        PrefManager.setUserName(userData['name']);
        PrefManager.setUserToken(accessToken.token);
        PrefManager.setUserProfileImage(userData['picture']['data']['url'].toString());
        onSucces();
        // _saveSocialUserData(userData['id'], accessToken.token, userData['picture']['data']['url'].toString(), userData['email'], userData['name']);
        // onSucces(userData['picture']['data']['url'].toString());
      } else {
        accessToken = await FacebookAuth.instance.login();
        print("FaceBook request ----> is Logged:::: ${(accessToken.toJson())}");
        Map<String, dynamic> userData =
            await FacebookAuth.instance.getUserData();
        // signUpSocialUser(
        //     social_type: "facebook",
        //     social_token: accessToken.token,
        //     social_id: userData['id'],
        //     userName: userData['name'],
        //     email: userData['email'],
        //     imageUrl: userData['picture']['data']['url'].toString(),
        //     onSuccess: onSucces,
        //     onError: (error) {
        //       onError(error.toString());
        //       print("signUpUser onError ---->" + error.toString());
        //     });
        PrefManager.setUserId(userData['id'].toString());
        PrefManager.setUserMail(userData['email']);
        PrefManager.setUserName(userData['name']);
        PrefManager.setUserToken(accessToken.token);
        PrefManager.setUserProfileImage(userData['picture']['data']['url'].toString());
        onSucces();
        // _saveSocialUserData(userData['id'], accessToken.token, userData['picture']['data']['url'].toString(), userData['email'], userData['name']);
        // onSucces(userData['picture']['data']['url'].toString());
      }
    } on FacebookAuthException catch (e) {
      // if the facebook login fails
      // check the error type
      switch (e.errorCode) {
        case FacebookAuthErrorCode.OPERATION_IN_PROGRESS:
          print("You have a previous login operation in progress");
          break;
        case FacebookAuthErrorCode.CANCELLED:
          print("login cancelled");
          break;
        case FacebookAuthErrorCode.FAILED:
          print("login failed");
          break;
      }
    } catch (e) {
      onError(e.toString());
    } finally {
      // update the view
    }
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
          _saveUserData(signUpResponse.data);
          onSuccess();
        },
        onError: (error) {
          onError(error.toString());
          print("signUpUser onError ---->" + error.toString());
        });
  }

  signUpSocialUser(
      {String userName,
      email,
      social_type,
      social_token,
      social_id,
      imageUrl,
      onSuccess,
      onError}) {
    print("userName: $userName + email : $email + social_type : $social_type");
    DIOManager().createSocialUser(
        userName: userName,
        mail: email,
        social_id: social_id,
        social_token: social_token,
        social_type: social_type,
        type: "0",
        imageUrl: imageUrl,
        onSuccess: (response) {
          print("signUpSocialUser onSuccess ---->" + response.toString());
          SignUpResponse signUpResponse = SignUpResponse.fromJson(response);
          _saveUserData(signUpResponse.data);
          _saveSocialUserData(social_token, imageUrl);
          onSuccess();
        },
        onError: (error) {
          onError(error.toString());
          print("signUpSocialUser onError ---->" + error.toString());
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

  updateUserGender({String gender, onSuccess, onError}) {
    DIOManager().updateUsergender(
        gender: gender,
        onSuccess: (response) {
          SignUpResponse signUpResponse = SignUpResponse.fromJson(response);
          _saveUserData(signUpResponse.data);
          onSuccess();
        },
        onError: (error) {
          onError(error.toString());
          print("updateUserData onError ---->" + error.toString());
        },
        uid: int.parse(PrefManager.getUserId()) ?? 7);
  }
  updateUserwarranty({int warranty, onSuccess, onError}) {
    DIOManager().updateUserwarranty(
        warranty: warranty,
        onSuccess: (response) {
          SignUpResponse signUpResponse = SignUpResponse.fromJson(response);
          _saveUserData(signUpResponse.data);
          onSuccess();
        },
        onError: (error) {
          onError(error.toString());
          print("updateUserData onError ---->" + error.toString());
        },
        uid: int.parse(PrefManager.getUserId()) ?? 7);
  }

  updateUserData(
      {File profileImagePath,
      birthDate,
      jobId,
      nationalityId,
      countryID,
      onSuccess,
      onError}) {
    // Map data = {
    //   "type": PrefManager().getUserType() ?? "0",
    //   "date_birth": birthDate ?? PrefManager().getBirthDate(),
    //   "country_id": countryID ?? PrefManager().getCountryID(),
    //   "job_id": jobId ?? PrefManager().getJobID(),
    //   "nationality_id": nationalityId ?? PrefManager().getNationalID()
    // };
    var path  = "";
    var name = "";
    if (profileImagePath?.path != null) {
       path = profileImagePath.path.toString();
       name = profileImagePath.path
          .split('/')
          .last;
    }
    DIOManager().updateUserInfo(
        uid: int.parse(PrefManager.getUserId()) ?? 7,
        profileImgPath: path,
        profileImgName: name,
        type: 0,
        dateBirth: birthDate ?? int.parse(PrefManager.getBirthDate()),
        countryId: countryID ?? int.parse(PrefManager.getCountryID()),
        jobId: jobId ?? int.parse(PrefManager.getJobID()),
        nationalityId:
            nationalityId ?? int.parse(PrefManager.getNationalID()),
        onSuccess: (response) {
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

  _saveSocialUserData(String social_token, String image) {
    _app.setUserToken(social_token);
    _app.setUserProfileImage(image);
  }

  _saveUserData(User user) {
    PrefManager.setUserId(user.id.toString());
    PrefManager.setUserMail(user.email);
    PrefManager.setUserName(user.name);
    PrefManager.serUserType(user.type.toString());
    PrefManager.setCityID(user.cityId.toString());
    PrefManager.setCountryID(user.countryId.toString());
    PrefManager.setDreamID(user.dreamId.toString());
    PrefManager.setJobID(user.jobId.toString());
    PrefManager.setEducationId(user.educationId.toString());
    PrefManager.setEducationCertificate(user.educationCertificate.toString());
    PrefManager.setNationalID(user.nationalityId.toString());
    PrefManager.setPersonalID(user.personalId.toString());
    PrefManager.serFatherCertificate(user.fatherCertificate.toString());
    PrefManager.setMotherCertificate(user.motherCertificate.toString());
    PrefManager.setParentMobile(user.parentMobile.toString());
    PrefManager.setGender(user.gender.toString());
    PrefManager.setDescription(user.description.toString());
    PrefManager.setWhatsApp(user.whatsApp.toString());
    PrefManager.setWarranty(user.warranty.toString());
  }
}
