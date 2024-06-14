import 'package:flutter/material.dart';

import 'home.dart';
import 'notification.dart';

class StudentSheet extends StatelessWidget {
  const StudentSheet({super.key});
  static const String routeName = 'student-sheet';
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(11.4),
        child: Column(
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
              const SizedBox(width: 48.0),
              const Text(
                'Student Sheet',
                style: TextStyle(
                    fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 48.0),
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
            ],
          ),
        ),
      ),
            Padding(
              padding: EdgeInsets.only(right: 150.0),
              child: Text(
                'Number Of Attendees: 5',
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16.0,
                    color: Colors.white),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(
                10,
              ),
              child: Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Image.network(
                            'https://firebasestorage.googleapis.com/v0/b/ischool-web-a2d36.appspot.com/o/admin%2Fimage%2FKhaled%20Said.jpg?alt=media&token=8cc8533d-347b-4903-aef9-98ff8034b381',
                            height: 200,
                            width: 200,
                          ),
                          Text(
                            'Khaled Said',
                            style: TextStyle(color: Colors.white),
                          ),
                          Text('Class 3-B',
                              style: TextStyle(color: Colors.white))
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Image.network(
                            'https://firebasestorage.googleapis.com/v0/b/ischool-web-a2d36.appspot.com/o/admin%2Fimage%2FReda%20moatasem%20.jpg?alt=media&token=3dbf0bde-cab0-41a0-bcb5-3b3c2968d41c',
                            height: 200,
                            width: 200,
                          ),
                          Text(
                            'Reda Moaatsem',
                            style: TextStyle(color: Colors.white),
                          ),
                          Text('Class 3-C',
                              style: TextStyle(color: Colors.white))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(
                10,
              ),
              child: Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Image.network(
                            'https://firebasestorage.googleapis.com/v0/b/ischool-web-a2d36.appspot.com/o/admin%2Fimage%2FOmnia%20Hossam.jpg?alt=media&token=dada4ad2-8cd7-4ea1-b8f7-77de0837990f',
                            height: 200,
                            width: 200,
                          ),
                          Text(
                            'Omnia Hassan',
                            style: TextStyle(color: Colors.white),
                          ),
                          Text('Class 5-C',
                              style: TextStyle(color: Colors.white))
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Image.network(
                            'https://firebasestorage.googleapis.com/v0/b/ischool-web-a2d36.appspot.com/o/admin%2Fimage%2FAya%20Hossam.jpg?alt=media&token=174cd4f7-2705-4ab6-abdc-84066bfbead0',
                            height: 200,
                            width: 200,
                          ),
                          Text(
                            'Aya Hossam',
                            style: TextStyle(color: Colors.white),
                          ),
                          Text('Class 3-D',
                              style: TextStyle(color: Colors.white))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(
                10,
              ),
              child: Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Image.network(
                            'https://firebasestorage.googleapis.com/v0/b/ischool-web-a2d36.appspot.com/o/admin%2Fimage%2FSandy%20selim.jpg?alt=media&token=fa32f9e8-509d-4f0b-b91d-7da2e5b1e991',
                            height: 200,
                            width: 200,
                          ),
                          Text(
                            'Sandy Selim',
                            style: TextStyle(color: Colors.white),
                          ),
                          Text('Class 6-A',
                              style: TextStyle(color: Colors.white))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}