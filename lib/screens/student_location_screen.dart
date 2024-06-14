import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../shared/constant.dart';
import 'face_recognition.dart';
import 'home.dart';
import 'notification.dart';

class StudentLocationScreen extends StatefulWidget {
  const StudentLocationScreen({super.key});

  @override
  _StudentLocationScreenState createState() => _StudentLocationScreenState();
}

class _StudentLocationScreenState extends State<StudentLocationScreen> {
  final List<Map<String, String>> students = [
    {
      'name': 'Khaled Said',
      'class': 'Class 3-B',
      'image':
          'https://firebasestorage.googleapis.com/v0/b/ischool-web-a2d36.appspot.com/o/admin%2Fimage%2FKhaled%20Said.jpg?alt=media&token=8cc8533d-347b-4903-aef9-98ff8034b381'
    },
    {
      'name': 'Reda Moatasem',
      'class': 'Class 3-C',
      'image':
          'https://firebasestorage.googleapis.com/v0/b/ischool-web-a2d36.appspot.com/o/admin%2Fimage%2FReda%20moatasem%20.jpg?alt=media&token=3dbf0bde-cab0-41a0-bcb5-3b3c2968d41c'
    },
    {
      'name': 'Aya Hossam',
      'class': 'Class 3-D',
      'image':
          'https://firebasestorage.googleapis.com/v0/b/ischool-web-a2d36.appspot.com/o/admin%2Fimage%2FAya%20Hossam.jpg?alt=media&token=174cd4f7-2705-4ab6-abdc-84066bfbead0'
    },
    {
      'name': 'Sandy Selim',
      'class': 'Class 6-A',
      'image':
          'https://firebasestorage.googleapis.com/v0/b/ischool-web-a2d36.appspot.com/o/admin%2Fimage%2FSandy%20selim.jpg?alt=media&token=fa32f9e8-509d-4f0b-b91d-7da2e5b1e991'
    },
    {
      'name': 'Omnia Hossam',
      'class': 'Class 5-C',
      'image':
          'https://firebasestorage.googleapis.com/v0/b/ischool-web-a2d36.appspot.com/o/admin%2Fimage%2FOmnia%20Hossam.jpg?alt=media&token=dada4ad2-8cd7-4ea1-b8f7-77de0837990f'
    },
  ];

  Future<void> _getAndOpenLocation(String name) async {
    if (name == 'Omnia Hossam') {
      await _openGoogleMaps('https://maps.app.goo.gl/jQCwsMDCA4qRWKqQ6');
      _moveStudentToEnd(name);
      return;
    }

    try {
      var db = FirebaseFirestore.instance;
      DocumentSnapshot<Map<String, dynamic>> document =
          await db.collection('Students Locations Mobile').doc(name).get();

      if (document.exists) {
        Map<String, dynamic>? data = document.data();
        if (data != null && data.containsKey('location')) {
          String location = data['location'];
          await _openGoogleMaps(location);
          _moveStudentToEnd(name);
        } else {
          print('Location field not found in the document');
        }
      } else {
        print('Document does not exist');
      }
    } catch (e) {
      print('Error fetching document: $e');
    }
  }

  Future<void> _openGoogleMaps(String url) async {
    Uri uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _moveStudentToEnd(String name) {
    setState(() {
      final student = students.firstWhere((student) => student['name'] == name);
      students.remove(student);
      students.add(student);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Container(
            color: thirdColor,
            child: Scaffold(
              backgroundColor: const Color(0xff071a26),
              body: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(23.0),
                      child: Container(
                        decoration: const BoxDecoration(
                            color: Color(0xffc2ccd2),
                            borderRadius: BorderRadius.all(
                              Radius.circular(20.0),
                            )),
                        width: 396,
                        height: 66.0,
                        child: Row(
                          children: [
                            const SizedBox(width: 10.0),
                            InkWell(
                              child: Image.asset(
                                'assets/logo.png',
                                height: 40,
                                width: 40,
                              ),
                              onTap: () =>
                                  Navigator.pushNamed(context, Home.routeName),
                            ),
                            const SizedBox(width: 30.0),
                            const Text(
                              ' Student Location',
                              style: TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(width: 20.0),
                            Stack(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.red,
                                    radius: 3.0,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () => Navigator.pushNamed(
                                      context, Notifications.routeName),
                                  icon: const Icon(Icons.notifications_none,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                            const SizedBox(width: 5),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: ListView.separated(
                        separatorBuilder: (context, index) => const SizedBox(height: 10,),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: students.length,
                        itemBuilder: (context, index) {
                          final student = students[index];
                          return _buildStudentRow(student['name']!,
                              student['class']!, student['image']!);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStudentRow(String name, String studentClass, String imageUrl) {
    return Row(
      children: [
        Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
              ),
              clipBehavior: Clip
                  .antiAlias, // Ensures the image respects the border radius
              child: Image.network(
                imageUrl,
                height: 150,
                width: 150,
                fit: BoxFit.cover, // Ensures the image covers the container
              ),
            ),
            Text(name, style: const TextStyle(color: Colors.white)),
            Text(studentClass, style: const TextStyle(color: Colors.white)),
          ],
        ),
        const SizedBox(width: 10.0),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
          ),
          onPressed: () async {
            await _getAndOpenLocation(name);
          },
          child: const Text('Start', style: TextStyle(color: Colors.white)),
        ),
        const SizedBox(width: 20.0),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Home(),
                ));
          },
          child: const Text('End', style: TextStyle(color: Colors.white)),
          style: ElevatedButton.styleFrom(
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
            backgroundColor: Colors.red,
          ),
        ),
        const SizedBox(width: 10.0),
        InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FaceRecognition(),
                ));
          },
          child: const ImageIcon(
              size: 50.0,
              AssetImage('assets/face-recognition.png'),
              color: Colors.white),
        ),
      ],
    );
  }
}
