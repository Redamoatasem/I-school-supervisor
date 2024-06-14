import 'dart:async';
import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:label_marker/label_marker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class OrderTrackingPage extends StatefulWidget {
  const OrderTrackingPage({Key? key}) : super(key: key);

  @override
  State<OrderTrackingPage> createState() => OrderTrackingPageState();
}

class OrderTrackingPageState extends State<OrderTrackingPage> {
  BitmapDescriptor? customIcon;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();
  GoogleMapController? controller;
  LocationData? currentLocation;
  LatLng? des;
  Set<Marker> markers = {};
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    setCustomIcon();
    getCurrentLocation();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void setCustomIcon() async {
    customIcon = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(devicePixelRatio: 2.5),
      'assets/ic_live.png',
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
    setState(() {
      this.controller = controller;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentLocation == null
          ? const Center(child: CircularProgressIndicator())
          : GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(currentLocation!.latitude!, currentLocation!.longitude!),
          zoom: 13.5,
        ),
        markers: markers,
        onMapCreated: _onMapCreated,
      ),
    );
  }

  void getCurrentLocation() async {
    try {
      Location location = Location();
      LocationData locData = await location.getLocation();
      setState(() {
        currentLocation = locData;
        User? user = FirebaseAuth.instance.currentUser;
        if (user != null) {
          String userId = user.uid;
          DocumentReference docRef = _firestore.collection('supervisor_location').doc(userId);

          docRef.get().then((doc) {
            if (doc.exists) {
              docRef.update({
                'latitude': locData.latitude,
                'longitude': locData.longitude,
                'timestamp': FieldValue.serverTimestamp(),
              });
            } else {
              docRef.set({
                'latitude': locData.latitude,
                'longitude': locData.longitude,
                'timestamp': FieldValue.serverTimestamp(),
              });
            }
          }).catchError((error) {
            print("Error checking document existence: $error");
          });
        } else {
          print("User is not authenticated");
        }
      });

      _updateMarker(currentLocation!);
      _updateFirestore(currentLocation!);

      GoogleMapController googleMapController = await _controller.future;

      location.onLocationChanged.listen((newLoc) {
        setState(() {
          currentLocation = newLoc;
        });
        _updateMarker(newLoc);

        googleMapController.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              zoom: 12.47,
              target: LatLng(newLoc.latitude!, newLoc.longitude!),
            ),
          ),
        );
      });

      _timer = Timer.periodic(Duration(seconds: 1), (timer) {
        if (currentLocation != null) {
          _updateFirestore(currentLocation!);
        }
      });
    } catch (e) {
      print("Error getting location: $e");
    }
  }

  void _updateMarker(LocationData location) {
    markers.addLabelMarker(LabelMarker(
      markerId: MarkerId('currentLocation'),
      position: LatLng(location.latitude!, location.longitude!),
      label: 'Current Location',
      backgroundColor: Colors.red,
    ));
    setState(() {});
  }

  void _updateFirestore(LocationData location) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        String userId = user.uid;
        DocumentReference docRef = _firestore.collection('supervisor_location').doc(userId);

        docRef.get().then((doc) {
          if (doc.exists) {
            // Document exists, update it
            docRef.update({
              'latitude': location.latitude,
              'longitude': location.longitude,
              'timestamp': FieldValue.serverTimestamp(),
            });
          } else {
            docRef.set({
              'latitude': location.latitude,
              'longitude': location.longitude,
              'timestamp': FieldValue.serverTimestamp(),
            });
          }
        }).catchError((error) {
          print("Error checking document existence: $error");
        });
      } else {
        print("User is not authenticated");
      }
    } catch (e) {
      print("Error updating Firestore: $e");
    }
  }
}
