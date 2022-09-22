import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutterapptask/screens/HomeCardscreen.dart';
import 'package:flutterapptask/screens/home_page_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutterapptask/screens/login_screen.dart';
import 'package:flutterapptask/services/navigation_services.dart';

import 'login_provider.dart';

class AppProvider with ChangeNotifier {
  splashscreen(context) {
    Future.delayed(Duration(seconds: 2));
    NavigationServices.replaceScreen(context, HomePageScreen());
  }
}
