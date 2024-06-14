import 'package:flutter/material.dart';
import 'package:tracker_login_register/screens/home.dart';
import 'package:tracker_login_register/screens/student_location_screen.dart';

import 'notification.dart';
class TodayTrip extends StatelessWidget {
  const TodayTrip({super.key});
  static const String routeName = 'today-trip';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                  const SizedBox(width: 60.0),
                  const Text(
                    'Today Trips',
                    style: TextStyle(
                        fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 60.0),
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
          Padding(padding: EdgeInsets.only(right: 250.0),child: Text('Morning Trip',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500),),),
          SizedBox(height: 10.0,),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              height: 190,
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
                    height: 30.0,
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
          ),
          //Image(image: AssetImage('assets/today_trip_container.png'),height: 250,width: 386,),
          SizedBox(height: 20.0,),
          Padding(padding: EdgeInsets.only(right: 250.0),child: Text('After Noon',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500),),),
          SizedBox(height: 10.0,),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              height: 190,
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
                    height: 30.0,
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
          ),
          //Image(image: AssetImage('assets/today_trip_container.png'),height: 250,width: 386,),
        ],
      ),
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