import 'package:flutter/material.dart';
import 'package:tracker_login_register/shared/constant.dart';

import 'home.dart';
import 'notification.dart';

class BusInfo extends StatelessWidget {
  const BusInfo({super.key});

  static const String routeName = 'bus-id';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: thirdColor,
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   title: Text('Bus Data'),
      //   centerTitle: true,
      //   actions: [
      //     Padding(
      //       padding: EdgeInsets.symmetric(horizontal: 16.0),
      //       child: Align(
      //         alignment: Alignment.centerRight,
      //         child: Text(
      //           'Supervisor',
      //           style: TextStyle(fontSize: 16),
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.all(
                15,
              ),
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
                      onTap: () => Navigator.pushNamed(context, Home.routeName),
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
                      '    Bus Data',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 40.0,
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
            SizedBox(
              height: 100,
            ),
            Card(
              color: Color(0xffc1cbd1),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Image.asset('assets/bus_id.PNG', width: 100),
                    SizedBox(width: 100),
                    Text('12336', style: TextStyle(fontSize: 24)),
                  ],
              ),
            ),
          ),
          SizedBox(height: 20),
          Card(
            color: Color(0xffc1cbd1),
            child: ListTile(
              leading: Image.asset('assets/driver.PNG'),
                title: Text('Reda moatasem'),
                subtitle: Text('📞 01202604594'),
              ),
          ),
        ],
      ),),
    );
  }
}
