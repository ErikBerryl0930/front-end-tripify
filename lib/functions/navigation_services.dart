import 'package:flutter/material.dart';

class NavigationServices {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static Future pushReplacement(Widget page) async {
    await navigatorKey.currentState?.pushReplacement(
      MaterialPageRoute(builder: (context) => page),
    );
  }
  
  static Future push(Widget page) async {
    await navigatorKey.currentState?.push(
      MaterialPageRoute(builder: (context) => page),
    );
  }
}
