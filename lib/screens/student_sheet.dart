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
              padding: EdgeInsets.all(
                23,
              ),
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xffc2ccd2),
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          20.0,
                        ),
                      )),
                  width: 396,
                  height: 66.0,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 10.0,
                      ),
                      //    Image.asset('assets/supervisor_logo.png',height: 40,width: 40,),
                      InkWell(
                        child: Image.asset(
                          'assets/supervisor_logo.png',
                          height: 40,
                          width: 40,
                        ),
                        onTap: () =>
                            Navigator.pushNamed(context, Home.routeName),
                      ),
                      SizedBox(
                        width: 50.0,
                      ),
                      // IconButton(
                      //   onPressed: () => Drawer(
                      //     backgroundColor: thirdColor,
                      //     child: ListView(
                      //       children: [
                      //         const DrawerHeader(
                      //           decoration: BoxDecoration(
                      //             color: Color(0xff0C344C),
                      //           ),
                      //           child: Image(
                      //             image: AssetImage(
                      //               'assets/logo.png',
                      //             ),
                      //           ),
                      //         ),
                      //         ListTile(
                      //           title: const Image(
                      //             image: AssetImage(
                      //               'assets/today_trips.png',
                      //             ),
                      //           ),
                      //           onTap: () {
                      //             // Update the state of the app.
                      //             // ...
                      //           },
                      //         ),
                      //         ListTile(
                      //           title: const Image(
                      //             image: AssetImage(
                      //               'assets/live.png',
                      //             ),
                      //           ),
                      //           onTap: () {
                      //             // Update the state of the app.
                      //             // ...
                      //           },
                      //         ),
                      //         ListTile(
                      //           title: const Image(
                      //             image: AssetImage(
                      //               'assets/face_recongnition.png',
                      //             ),
                      //           ),
                      //           onTap: () {
                      //             // Update the state of the app.
                      //             // ...
                      //           },
                      //         ),
                      //         ListTile(
                      //           title: const Image(
                      //             image: AssetImage(
                      //               'assets/student_sheet.png',
                      //             ),
                      //           ),
                      //           onTap: () {
                      //             // Update the state of the app.
                      //             // ...
                      //           },
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      //   icon: Icon(
                      //     Icons.menu,
                      //     color: Colors.black,
                      //   ),
                      // ),
                      // SizedBox(
                      //   width: 50.0,
                      // ),
                      Text(
                        'Student Sheet',
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      Stack(
                        children: [
                          Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 25, vertical: 10),
                              child: CircleAvatar(
                                backgroundColor: Colors.red,
                                radius: 3.0,
                              )),
                          IconButton(
                            onPressed: () => Navigator.pushNamed(
                                context, Notifications.routeName),
                            icon: Icon(Icons.notifications_none,
                                color: Colors.black),
                          )
                        ],
                      ),
                    ],
                  ),
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