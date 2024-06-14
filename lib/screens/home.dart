import 'package:flutter/material.dart';
import 'package:tracker_login_register/screens/live.dart';
import 'package:tracker_login_register/screens/setting.dart';
import 'package:tracker_login_register/screens/student_location_screen.dart';
import 'package:tracker_login_register/screens/student_sheet.dart';
import 'package:tracker_login_register/screens/today_trip.dart';
import 'package:tracker_login_register/shared/constant.dart';

import 'face_recognition.dart';

class Home extends StatefulWidget {
  Home({super.key});

  static const String routeName = 'home';

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;
  final List<Widget> screens = [
    TodayTrip(),
    StudentLocationScreen(),
    Live(),
    FaceRecognition(),
    StudentSheet(),
    Setting()
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: thirdColor,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: IndexedStack(
          index: currentIndex,
          children: screens,
        ),
        bottomNavigationBar: BottomNavigationBar(
          showUnselectedLabels: true,
          currentIndex: currentIndex,
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          unselectedItemColor: Colors.white,
          selectedItemColor: primaryColor,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.directions_bus_rounded),
              label: 'Today Trip',
              backgroundColor: secondryColor,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.location_history_rounded),
              label: 'Student Location',
              backgroundColor: secondryColor,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.location_on_outlined),
              label: 'Live',
              backgroundColor: secondryColor,
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/face-recognition.png'),
              ),
              label: 'Face Recognition',
              backgroundColor: secondryColor,
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/Black.png'),
              ),
              label: 'Student Sheet',
              backgroundColor: secondryColor,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Setting',
              backgroundColor: secondryColor,
            ),
          ],
        ),
      ),
    );
  }
}
