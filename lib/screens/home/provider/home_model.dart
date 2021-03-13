import 'package:aytamy/common/model/User.dart';
import 'package:aytamy/network/dio_manager.dart';
import 'package:aytamy/screens/home/model/most_recent_response.dart';
import 'package:flutter/cupertino.dart';

class HomeModel extends ChangeNotifier {
  List<User> mostRecentUsers;

  void getMostRecentUsers() {
       mostRecentUsers = [User(),User(),User(),User()];
       return
    DIOManager().getMostRecentUsers(onSuccess: (response) {
      print("getMostRecentUsers onSuccess ---->" + response.toString());
      MostRecentResponse mostRecentResponse =
          MostRecentResponse.fromJson(response);
      // mostRecentUsers = mostRecentResponse.data;

      notifyListeners();
    }, onError: (error) {
      print("getMostRecentUsers onError ---->" + error.toString());
    });
  }
}
