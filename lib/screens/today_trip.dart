import 'package:flutter/material.dart';
import 'package:tracker_login_register/screens/student_location_screen.dart';

import 'notification.dart';
class TodayTrip extends StatelessWidget {
  const TodayTrip({super.key});
  static const String routeName = 'today-trip';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(
            35,
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
                SizedBox(width: 10.0,),
                Image.asset('assets/supervisor_logo.png',height: 40,width: 40,),
                SizedBox(width: 50.0,),
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
                  '   Today Trips',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 40.0,
                ),
                Stack(
                  children: [
                    Padding(padding: EdgeInsets.symmetric(horizontal: 25,vertical: 10),child: CircleAvatar(backgroundColor: Colors.red,radius: 3.0,)),
                    IconButton(onPressed: () => Navigator.pushNamed(context, Notifications.routeName), icon: Icon(Icons.notifications_none,color: Colors.black),)
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 20.0,),
        Padding(padding: EdgeInsets.only(right: 250.0),child: Text('Morning Trip',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500),),),
        SizedBox(height: 10.0,),
        Container(
          height: 213,
          width: 428,
          decoration: BoxDecoration(
            color: Color(0xffc2ccd2),
            borderRadius: BorderRadius.all(Radius.circular(25.0,),),
          ),
          child: Column(
            children: [
              SizedBox(height: 5.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('To School'),
                  SizedBox(width: 150.0,),
                  Text('6:00 AM'),
                ],
              ),
              SizedBox(height: 20.0,),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CreatePersonToSchhol(
                        'https://firebasestorage.googleapis.com/v0/b/ischool-web-a2d36.appspot.com/o/admin%2Fimage%2FKhaled%20Said.jpg?alt=media&token=8cc8533d-347b-4903-aef9-98ff8034b381',
                        'Khaled said'),
                    CreatePersonToSchhol(
                        'https://firebasestorage.googleapis.com/v0/b/ischool-web-a2d36.appspot.com/o/admin%2Fimage%2FReda%20moatasem%20.jpg?alt=media&token=3dbf0bde-cab0-41a0-bcb5-3b3c2968d41c',
                        'Reda Moatasem'),
                    CreatePersonToSchhol(
                        'https://firebasestorage.googleapis.com/v0/b/ischool-web-a2d36.appspot.com/o/admin%2Fimage%2FAya%20Hossam.jpg?alt=media&token=174cd4f7-2705-4ab6-abdc-84066bfbead0',
                        'Aya Hossam'),
                    CreatePersonToSchhol(
                        'https://firebasestorage.googleapis.com/v0/b/ischool-web-a2d36.appspot.com/o/admin%2Fimage%2FSandy%20selim.jpg?alt=media&token=fa32f9e8-509d-4f0b-b91d-7da2e5b1e991',
                        'Sandy Selim'),
                    CreatePersonToSchhol(
                        'https://firebasestorage.googleapis.com/v0/b/ischool-web-a2d36.appspot.com/o/admin%2Fimage%2FOmnia%20Hossam.jpg?alt=media&token=dada4ad2-8cd7-4ea1-b8f7-77de0837990f',
                        'Omnia Hossam'),
                  ],
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
              InkWell(
                child: Image.asset('assets/start_button.png'),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => StudentLocationScreen()),
                ),
              ),
            ],
          ),
        ),
        //Image(image: AssetImage('assets/today_trip_container.png'),height: 250,width: 386,),
        SizedBox(height: 40.0,),
        Padding(padding: EdgeInsets.only(right: 250.0),child: Text('After Noon',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500),),),
        SizedBox(height: 10.0,),
        Container(
          height: 213,
          width: 428,
          decoration: BoxDecoration(
            color: Color(0xffc2ccd2),
            borderRadius: BorderRadius.all(Radius.circular(25.0,),),
          ),
          child: Column(
            children: [
              SizedBox(height: 5.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('To Home'),
                  SizedBox(width: 150.0,),
                  Text('2:00 AM'),
                ],
              ),
              SizedBox(height: 20.0,),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CreatePersonToSchhol(
                        'https://firebasestorage.googleapis.com/v0/b/ischool-web-a2d36.appspot.com/o/admin%2Fimage%2FKhaled%20Said.jpg?alt=media&token=8cc8533d-347b-4903-aef9-98ff8034b381',
                        'Khaled said'),
                    CreatePersonToSchhol(
                        'https://firebasestorage.googleapis.com/v0/b/ischool-web-a2d36.appspot.com/o/admin%2Fimage%2FReda%20moatasem%20.jpg?alt=media&token=3dbf0bde-cab0-41a0-bcb5-3b3c2968d41c',
                        'Reda Moatasem'),
                    CreatePersonToSchhol(
                        'https://firebasestorage.googleapis.com/v0/b/ischool-web-a2d36.appspot.com/o/admin%2Fimage%2FAya%20Hossam.jpg?alt=media&token=174cd4f7-2705-4ab6-abdc-84066bfbead0',
                        'Aya Hossam'),
                    CreatePersonToSchhol(
                        'https://firebasestorage.googleapis.com/v0/b/ischool-web-a2d36.appspot.com/o/admin%2Fimage%2FSandy%20selim.jpg?alt=media&token=fa32f9e8-509d-4f0b-b91d-7da2e5b1e991',
                        'Sandy Selim'),
                    CreatePersonToSchhol(
                        'https://firebasestorage.googleapis.com/v0/b/ischool-web-a2d36.appspot.com/o/admin%2Fimage%2FOmnia%20Hossam.jpg?alt=media&token=dada4ad2-8cd7-4ea1-b8f7-77de0837990f',
                        'Omnia Hossam'),
                  ],
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
              InkWell(
                child: Image.asset('assets/start_button.png'),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => StudentLocationScreen()),
                ),
              ),
            ],
          ),
        ),
        //Image(image: AssetImage('assets/today_trip_container.png'),height: 250,width: 386,),
      ],
    );
  }

  Widget CreatePersonToSchhol(String photo, String name) {
    return Row(
      children: [
        CircleAvatar(
          radius: 30.0, // Adjust the radius as needed
          child: ClipOval(
            child: Image.network(
              photo,
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          width: 10.0,
        ),
        Text(
          name,
          style: TextStyle(color: Colors.black),
        ),
        SizedBox(
          width: 20.0,
        )
      ],
    );
  }
}