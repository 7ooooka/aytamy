import 'package:aytamy/common/model/User.dart';
import 'package:aytamy/network/dio_manager.dart';
import 'package:aytamy/screens/home/model/response.dart';
import 'package:flutter/cupertino.dart';

class HomeModel extends ChangeNotifier {
  List<User> mostRecentUsers;
  List<User> BeingBailedUsers;
  List<User> SearchUsers = [];

  User currentSelectedRecentUser;

  void setCurrentSelectedRecentUser(user) {
    currentSelectedRecentUser = user;
    notifyListeners();
  }

  void getMostRecentUsers() {
    mostRecentUsers = [User(), User(), User(), User()];
    return DIOManager().getMostRecentUsers(onSuccess: (response) {
      print("getMostRecentUsers onSuccess ---->" + response.toString());
      Response mostRecentResponse = Response.fromJson(response);
      mostRecentUsers = mostRecentResponse.data;
      notifyListeners();
    }, onError: (error) {
      print("getMostRecentUsers onError ---->" + error.toString());
    });
  }

  void getBeingBailedUsers() {
    BeingBailedUsers = [User(), User(), User(), User()];
    return DIOManager().getBeingBailedUsers(onSuccess: (response) {
      print("getBeingBailedUsers onSuccess ---->" + response.toString());
      Response BeingBailedUsersResponse = Response.fromJson(response);
      BeingBailedUsers = BeingBailedUsersResponse.data;
      notifyListeners();
    }, onError: (error) {
      print("getBeingBailedUsers onError ---->" + error.toString());
    });
  }

  void clearSearch() {
    SearchUsers.clear();
    notifyListeners();
  }

  void getSearchResult(String value, {onSucess, onError}) {
    return DIOManager().getSearchUsers(value, onSuccess: (response) {
      print("getSearchUsers onSuccess ---->" + response.toString());
      Response BeingBailedUsersResponse = Response.fromJson(response);
      SearchUsers = BeingBailedUsersResponse.data;
      onSucess();
      notifyListeners();
    }, onError: (error) {
      onError(error);
      print("getSearchUsers onError ---->" + error.toString());
    });
  }
}
