import 'dart:math';

// import 'package:facesdk_plugin/facedetection_interface.dart';
import 'package:flutter/material.dart';
import 'package:tracker_login_register/screens/face_recognition_2.dart';
import 'package:tracker_login_register/screens/home.dart';
import 'package:tracker_login_register/screens/person.dart';
import 'package:tracker_login_register/shared/constant.dart';

import 'facedetectionview.dart';

class FaceRecognition extends StatefulWidget {
  static const String routeName = 'face-recognition';

  FaceRecognition({super.key});

  @override
  _FaceRecognitionState createState() => _FaceRecognitionState();
}

class _FaceRecognitionState extends State<FaceRecognition> {
  var personList = <Person>[];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: thirdColor,
      child: Stack(children: [
        Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            leading: IconButton(
                onPressed: () => Navigator.pushNamed(context, Home.routeName),
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                )),
          ),
          backgroundColor: Colors.transparent,
          body: ListView(children: [
            Column(
              children: [

                SizedBox(
                  height: 25,
                ),
                Image(
                  image: AssetImage('assets/face_id.png'),
                ),
                SizedBox(
                  height: 80.0,
                ),
                GestureDetector(
                  child: Image(
                    image: AssetImage(
                      'assets/get_started_container.png',
                    ),
                    height: 56,
                    width: 396,
                  ),
                  onTap: () => Navigator.pushNamed(
                      context, FaceRecognitionTwo.routeName),
                ),
              ],
            ),
          ]),
        ),
      ]),
    );
  }
}
// class FacePainter extends CustomPainter {
//   final ui.Image image;
//   final List<Face> faces;
//   final List<Rect> rects = [];
//
//   FacePainter(this.image, this.faces) {
//     for (var i = 0; i < faces.length; i++) {
//       rects.add(faces[i].boundingBox);
//     }
//   }
//
//   @override
//   void paint(ui.Canvas canvas, ui.Size size) {
//     final Paint paint = Paint()
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 15.0
//       ..color = Colors.blue;
//
//     canvas.drawImage(image, Offset.zero, Paint());
//     for (var i = 0; i < faces.length; i++) {
//       canvas.drawRect(rects[i], paint);
//     }
//   }
//
//   @override
//   bool shouldRepaint(FacePainter oldDelegate) {
//     return image != oldDelegate.image || faces != oldDelegate.faces;
//   }
// }