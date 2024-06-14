import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tracker_login_register/screens/login.dart';
import 'package:tracker_login_register/screens/supervising_students.dart';
import 'package:tracker_login_register/screens/home.dart';

import '../Network/local/cache_helper.dart';
import '../shared/constant.dart';

class Splash extends StatefulWidget {
  static const String routeName = 'splash';

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _checkOnboardingStatus();
  }

  Future<void> _checkOnboardingStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool hasSeenOnboarding = prefs.getBool('hasSeenOnboarding') ?? false;

    String? userId = await CacheHelper.getData(key: 'isLogged');
    print('User ID from cache: $userId');

    if (hasSeenOnboarding) {
      if (userId != null) {
        print('User is logged in: $userId');
        Timer(Duration(seconds: 4), navigateToHome);
      } else {
        Timer(Duration(seconds: 4), navigateToLogin);
      }
    } else {
      Timer(Duration(seconds: 4), navigateToOnboarding);
    }
  }

  void navigateToHome() {
    Navigator.pushNamedAndRemoveUntil(context, Home.routeName, (route) => false);
  }

  void navigateToLogin() {
    Navigator.pushNamedAndRemoveUntil(context, Login.routeName, (route) => false);
  }

  void navigateToOnboarding() {
    Navigator.pushNamedAndRemoveUntil(context, SupervisingStudents.routeName, (route) => false);
    _setOnboardingSeen();
  }

  Future<void> _setOnboardingSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('hasSeenOnboarding', true);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: thirdColor,
      child: Stack(
        children: [
          Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(child: Image.asset('assets/i_school_bus.png')),
          )
        ],
      ),
    );
  }
}
