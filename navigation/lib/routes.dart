import 'package:flutter/material.dart';
import 'package:navigation/screen2_page.dart';
import 'package:navigation/screenl_page.dart';

class PageRoutes {
  static String screenl_page = "screenl"; static String screen2_page = "screen2";
  Map<String, WidgetBuilder> routeMaker() {

    return {
      screenl_page: (context) => Screen1 (),
      screen2_page: (context) => Screen2 (),
    };
  }
}