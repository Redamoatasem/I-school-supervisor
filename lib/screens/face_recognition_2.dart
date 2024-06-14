import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tracker_login_register/screens/face_recognition_3.dart';

import '../shared/constant.dart';

// class FaceRecognitionTwo extends StatelessWidget {
//   const FaceRecognitionTwo({super.key});
//   static const String routeName = 'faceRecognitionTwo';
class FaceRecognitionTwo extends StatefulWidget {
  static const String routeName = 'face-recognition-two';

  @override
  State<FaceRecognitionTwo> createState() => _FaceRecognitionTwoState();
}

class _FaceRecognitionTwoState extends State<FaceRecognitionTwo> {
  void initState() {
    super.initState();
    Timer(Duration(seconds: 4), navigateTo);
  }

  void navigateTo() {
    Navigator.pushNamedAndRemoveUntil(
        context, FaceRecognitionThree.routeName, (route) => false);
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          color: thirdColor,
          child: Stack(
            children: [
              Scaffold(
                backgroundColor: Colors.transparent,
                body: Padding(
                  padding: EdgeInsets.only(left: 50.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(image: AssetImage('assets/child_recognized.png')),
                      SizedBox(
                        height: 50.0,
                      ),
                      Image(image: AssetImage('assets/face_lock.png')),
                      SizedBox(
                        height: 90.0,
                      ),
                      Image(image: AssetImage('assets/seventy_percent.png')),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        'Scanning...',
                        style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
