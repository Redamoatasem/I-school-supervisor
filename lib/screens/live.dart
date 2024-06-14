import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:location/location.dart' as loc;
import 'package:tracker_login_register/screens/student_location_screen.dart';
import '../shared/location_manager.dart';
import 'google_maps_page.dart';
import 'home.dart';
import 'notification.dart';
import 'order_tracking_page.dart';

class Live extends StatefulWidget {
  const Live({super.key});

  static const String routeName = 'live';

  @override
  State<Live> createState() => _LiveState();
}

class _LiveState extends State<Live> {
  LocationManager locationManager = LocationManager();
  static const String userLocationId = 'user';
  GoogleMapController? _controller;
  static CameraPosition userLocation = const CameraPosition(
    target: LatLng(30.0360786, 31.1965017),
    zoom: 17,
  );
  final loc.Location location = loc.Location();
  StreamSubscription<loc.LocationData>? _locationSubscription;
  final Completer<GoogleMapController> controller = Completer<GoogleMapController>();
  Set<Marker> markers = {
    Marker(
        markerId: const MarkerId(userLocationId), position: userLocation.target)
  };
  Timer? locationTimer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(
              34,
            ),
            child: Container(
              decoration: const BoxDecoration(
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
                  const SizedBox(
                    width: 10.0,
                  ),
                  InkWell(
                    child: Image.asset(
                      'assets/logo.png',
                      height: 40,
                      width: 40,
                    ),
                    onTap: () => Navigator.pushNamed(context, Home.routeName),
                  ),
                  const SizedBox(
                    width: 50.0,
                  ),
                  const Text(
                    'Live Location',
                    style:
                    TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 35.0,
                  ),
                  Stack(
                    children: [
                      const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 25, vertical: 10),
                          child: CircleAvatar(
                            backgroundColor: Colors.red,
                            radius: 3.0,
                          )),
                      IconButton(
                        onPressed: () => Navigator.pushNamed(
                            context, Notifications.routeName),
                        icon: const Icon(Icons.notifications_none,
                            color: Colors.black),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(child: OrderTrackingPage()),
        ],
      ),
    );
  }


  void changeMapPosition(LocationData locationData) {
    // كل ما الماركر بيتحرك بتتحرك الكاميرا معاه
    _controller?.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: userLocation.target, zoom: 17)));
  }
}
