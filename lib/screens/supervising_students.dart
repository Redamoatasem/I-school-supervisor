import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:tracker_login_register/screens/bus_driver.dart';
import 'package:tracker_login_register/screens/bus_supervisor.dart';

import '../shared/components.dart';
import '../shared/constant.dart';

class SupervisingStudents extends StatelessWidget {
  static const String routeName = 'supervising-students';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: thirdColor,
      child: Stack(
        children: [
          Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/supervising_students.png',
                      width: 372,
                      height: 372,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Supervising Students',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 32,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'On the bus from going to returning and',
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'assuming all their responsibilities',
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    //
                    DotsIndicator(
                      dotsCount: 2,
                      position: 0,
                      decorator: DotsDecorator(
                        activeColors: [Color(0xfff2ba52), Colors.black],
                        size: const Size.square(9.0),
                        activeSize: const Size(35.0, 9.0),
                        activeShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    defaultButton(
                        textStyle: Colors.black,
                        background: primaryColor,
                        function: () => Navigator.pushNamedAndRemoveUntil(
                            context, BusSupervisor.routeName, (route) => false),
                        text: 'Next'),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
