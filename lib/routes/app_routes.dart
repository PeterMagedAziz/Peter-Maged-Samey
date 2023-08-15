import 'package:flutter/material.dart';
import 'package:peter_s_application1/presentation/log_in_screen/log_in_screen.dart';
import 'package:peter_s_application1/presentation/register_screen/register_screen.dart';
import 'package:peter_s_application1/presentation/profile_screen/profile_screen.dart';
import 'package:peter_s_application1/presentation/app_navigation_screen/app_navigation_screen.dart';

class AppRoutes {
  static const String logInScreen = '/log_in_screen';

  static const String registerScreen = '/register_screen';

  static const String profileScreen = '/profile_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static Map<String, WidgetBuilder> routes = {
    logInScreen: (context) => LoginScreen(),
    // registerScreen: (context) => RegisterScreen(),
    profileScreen: (context) => ProfileScreen(),
    appNavigationScreen: (context) => AppNavigationScreen()
  };
}
