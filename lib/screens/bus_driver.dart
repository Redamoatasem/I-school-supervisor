import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:tracker_login_register/screens/login.dart';
import 'package:tracker_login_register/shared/components.dart';
import 'package:tracker_login_register/shared/constant.dart';

class BusDriver extends StatelessWidget {
  static const String routeName = 'bus-driver';

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
                      'assets/bus_driver.png',
                      width: 372,
                      height: 372,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Bus Driver',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 32,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Coordinating appointments wit the bus driver',
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'and the students families, Supervising',
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'children during the trip',
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    DotsIndicator(
                      dotsCount: 2,
                      position: 1,
                      decorator: DotsDecorator(
                        activeColors: [Colors.black, Color(0xfff2ba52)],
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
                            context, Login.routeName, (route) => false),
                        text: 'Next'),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
