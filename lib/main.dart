import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/app.dart';

void main() {
  // SharedPreferences.setMockInitialValues({});
  Provider.debugCheckInvalidValueType = null;
  runApp(App());
}


