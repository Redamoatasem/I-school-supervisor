import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tracker_login_register/screens/bus_driver.dart';
import 'package:tracker_login_register/screens/bus_info.dart';
import 'package:tracker_login_register/screens/bus_supervisor.dart';
import 'package:tracker_login_register/screens/create_new_password.dart';
import 'package:tracker_login_register/screens/face_recognition.dart';
import 'package:tracker_login_register/screens/face_recognition_2.dart';
import 'package:tracker_login_register/screens/face_recognition_3.dart';
import 'package:tracker_login_register/screens/forgot_password.dart';
import 'package:tracker_login_register/screens/home.dart';
import 'package:tracker_login_register/screens/live.dart';
import 'package:tracker_login_register/screens/login.dart';
import 'package:tracker_login_register/screens/notification.dart';
import 'package:tracker_login_register/screens/otp_verification.dart';
import 'package:tracker_login_register/screens/person.dart';
import 'package:tracker_login_register/screens/profile.dart';
import 'package:tracker_login_register/screens/register.dart';
import 'package:tracker_login_register/screens/setting.dart';
import 'package:tracker_login_register/screens/splash.dart';
import 'package:tracker_login_register/screens/student_sheet.dart';
import 'package:tracker_login_register/screens/supervising_students.dart';
import 'package:tracker_login_register/screens/support.dart';
import 'package:tracker_login_register/screens/today_trip.dart';
import 'package:tracker_login_register/shared/app_provider.dart';
import 'firebase_options.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  var provider = AppProvider();
  runApp(ChangeNotifierProvider(
      create: (buildContext) {
        return provider;
      },
      child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var personList = <Person>[];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Splash.routeName, //هنا ترتيب الصفحات ياصاحبى
      routes: {
        Splash.routeName: (context) => Splash(),
        SupervisingStudents.routeName: (context) => SupervisingStudents(),
        BusDriver.routeName: (context) => BusDriver(),
        Login.routeName: (context) => Login(),
        Register.routeName: (context) => Register(),
        Home.routeName: (context) => Home(),
        StudentSheet.routeName: (context) => StudentSheet(),
        TodayTrip.routeName: (context) => TodayTrip(),
        Live.routeName: (context) => Live(),
        FaceRecognition.routeName: (context) => FaceRecognition(),
        FaceRecognitionTwo.routeName: (context) => FaceRecognitionTwo(),
        Setting.routeName: (context) => Setting(),
        Profile.routeName: (context) => Profile(),
        BusInfo.routeName: (context) => BusInfo(),
        Support.routeName: (context) => Support(),
        FaceRecognitionThree.routeName: (context) => FaceRecognitionThree(),
        Notifications.routeName: (context) => Notifications(),
        BusSupervisor.routeName: (context) => BusSupervisor(),
        CreateNewPassword.routeName: (context) => CreateNewPassword(),
        ForgotPassword.routeName: (context) => ForgotPassword(),
        OtpVerification.routeName: (context) => OtpVerification(),
        // FaceRecognitionView.routeName : (context) => FaceRecognitionView(personList: personList,),
      },
    );
  }
}
// class MyHomePage extends StatefulWidget {
//   final String title;
//   var personList = <Person>[];
//
//   MyHomePage({super.key, required this.title});
//
//   @override
//   MyHomePageState createState() => MyHomePageState();
// }
//
// class MyHomePageState extends State<MyHomePage> {
//   String _warningState = "";
//   bool _visibleWarning = false;
//
//   // final _facesdkPlugin = FacesdkPlugin();
//
//   @override
//   void initState() {
//     super.initState();

// init();
// }

// Future<void> init() async {
//   int facepluginState = -1;
//   String warningState = "";
//   bool visibleWarning = false;
//
//   try {
//     if (Platform.isAndroid) {
//       await _facesdkPlugin
//           .setActivation(
//           "CFO+UUpNLaDMlmdjoDlhBMbgCwT27CzQJ4xHpqe9rDOErwoEUeCGPRTfQkZEAFAFdO0+rTNRIwnQ"
//               "wpqqGxBbfnLkfyFeViVS5bpWZFk15QXP3ZtTEuU1rK5zsFwcZrqRUxsG9dXImc+Vw5Ddc9zBp9GE"
//               "UuDycHLqC9KgQGVb0TS2u9Kz67HQOSDw9hskjBpjRbqiG+F/h5DBLPzjgFh1Y6vzgg6I59FzTOcd"
//               "rdEbX7kI15Nwgf1hvHGtSgON/a0Fmw+XNdnxH2pVY96mcTemHYZAtxh8lA/t1DtTyZXpHjW8N6nq"
//               "4UN2YDlKLXSrDzLpLHJmBsdpH71AXb7dfAq94Q==")
//           .then((value) => facepluginState = value ?? -1);
//     } else {
//       await _facesdkPlugin
//           .setActivation(
//           "nWsdDhTp12Ay5yAm4cHGqx2rfEv0U+Wyq/tDPopH2yz6RqyKmRU+eovPeDcAp3T3IJJYm2LbPSEz"
//               "+e+YlQ4hz+1n8BNlh2gHo+UTVll40OEWkZ0VyxkhszsKN+3UIdNXGaQ6QL0lQunTwfamWuDNx7Ss"
//               "efK/3IojqJAF0Bv7spdll3sfhE1IO/m7OyDcrbl5hkT9pFhFA/iCGARcCuCLk4A6r3mLkK57be4r"
//               "T52DKtyutnu0PDTzPeaOVZRJdF0eifYXNvhE41CLGiAWwfjqOQOHfKdunXMDqF17s+LFLWwkeNAD"
//               "PKMT+F/kRCjnTcC8WPX3bgNzyUBGsFw9fcneKA==")
//           .then((value) => facepluginState = value ?? -1);
//     }
//
//     if (facepluginState == 0) {
//       await _facesdkPlugin
//           .init()
//           .then((value) => facepluginState = value ?? -1);
//     }
//   } catch (e) {}
//
//   List<Person> personList = await loadAllPersons();
//   // await SettingsPageState.initSettings();
//
//   final prefs = await SharedPreferences.getInstance();
//   int? livenessLevel = prefs.getInt("liveness_level");
//
//   try {
//     await _facesdkPlugin
//         .setParam({'check_liveness_level': livenessLevel ?? 0});
//   } catch (e) {}
//
//   // If the widget was removed from the tree while the asynchronous platform
//   // message was in flight, we want to discard the reply rather than calling
//   // setState to update our non-existent appearance.
//   if (!mounted) return;
//
//   if (facepluginState == -1) {
//     warningState = "Invalid license!";
//     visibleWarning = true;
//   } else if (facepluginState == -2) {
//     warningState = "License expired!";
//     visibleWarning = true;
//   } else if (facepluginState == -3) {
//     warningState = "Invalid license!";
//     visibleWarning = true;
//   } else if (facepluginState == -4) {
//     warningState = "No activated!";
//     visibleWarning = true;
//   } else if (facepluginState == -5) {
//     warningState = "Init error!";
//     visibleWarning = true;
//   }
//
//   setState(() {
//     _warningState = warningState;
//     _visibleWarning = visibleWarning;
//     widget.personList = personList;
//   });
// }
//
// Future<Database> createDB() async {
//   final database = openDatabase(
//     // Set the path to the database. Note: Using the `join` function from the
//     // `path` package is best practice to ensure the path is correctly
//     // constructed for each platform.
//     join(await getDatabasesPath(), 'person.db'),
//     // When the database is first created, create a table to store dogs.
//     onCreate: (db, version) {
//       // Run the CREATE TABLE statement on the database.
//       return db.execute(
//         'CREATE TABLE person(name text, faceJpg blob, templates blob)',
//       );
//     },
//     // Set the version. This executes the onCreate function and provides a
//     // path to perform database upgrades and downgrades.
//     version: 1,
//   );
//
//   return database;
// }
//
// // A method that retrieves all the dogs from the dogs table.
// Future<List<Person>> loadAllPersons() async {
//   // Get a reference to the database.
//   final db = await createDB();
//
//   // Query the table for all The Dogs.
//   final List<Map<String, dynamic>> maps = await db.query('person');
//
//   // Convert the List<Map<String, dynamic> into a List<Dog>.
//   return List.generate(maps.length, (i) {
//     return Person.fromMap(maps[i]);
//   });
// }
//
// Future<void> insertPerson(Person person) async {
//   // Get a reference to the database.
//   final db = await createDB();
//
//   // Insert the Dog into the correct table. You might also specify the
//   // `conflictAlgorithm` to use in case the same dog is inserted twice.
//   //
//   // In this case, replace any previous data.
//   await db.insert(
//     'person',
//     person.toMap(),
//     conflictAlgorithm: ConflictAlgorithm.replace,
//   );
//
//   setState(() {
//     widget.personList.add(person);
//   });
// }
//
// Future<void> deleteAllPerson() async {
//   final db = await createDB();
//   await db.delete('person');
//
//   setState(() {
//     widget.personList.clear();
//   });
//
//   Fluttertoast.showToast(
//       msg: "All person deleted!",
//       toastLength: Toast.LENGTH_SHORT,
//       gravity: ToastGravity.BOTTOM,
//       timeInSecForIosWeb: 1,
//       backgroundColor: Colors.red,
//       textColor: Colors.white,
//       fontSize: 16.0);
// }
//
// Future<void> deletePerson(index) async {
//   // ignore: invalid_use_of_protected_member
//
//   final db = await createDB();
//   await db.delete('person',
//       where: 'name=?', whereArgs: [widget.personList[index].name]);
//
//   // ignore: invalid_use_of_protected_member
//   setState(() {
//     widget.personList.removeAt(index);
//   });
//
//   Fluttertoast.showToast(
//       msg: "Person removed!",
//       toastLength: Toast.LENGTH_SHORT,
//       gravity: ToastGravity.BOTTOM,
//       timeInSecForIosWeb: 1,
//       backgroundColor: Colors.red,
//       textColor: Colors.white,
//       fontSize: 16.0);
// }
//
// Future enrollPerson() async {
//   try {
//     final image = await ImagePicker().pickImage(source: ImageSource.gallery);
//     if (image == null) return;
//
//     var rotatedImage =
//     await FlutterExifRotation.rotateImage(path: image.path);
//
//     final faces = await _facesdkPlugin.extractFaces(rotatedImage.path);
//     for (var face in faces) {
//       num randomNumber =
//           10000 + Random().nextInt(10000); // from 0 upto 99 included
//       Person person = Person(
//           name: 'Person' + randomNumber.toString(),
//           faceJpg: face['faceJpg'],
//           templates: face['templates']);
//       insertPerson(person);
//     }
//
//     if (faces.length == 0) {
//       Fluttertoast.showToast(
//           msg: "No face detected!",
//           toastLength: Toast.LENGTH_SHORT,
//           gravity: ToastGravity.BOTTOM,
//           timeInSecForIosWeb: 1,
//           backgroundColor: Colors.red,
//           textColor: Colors.white,
//           fontSize: 16.0);
//     } else {
//       Fluttertoast.showToast(
//           msg: "Person enrolled!",
//           toastLength: Toast.LENGTH_SHORT,
//           gravity: ToastGravity.BOTTOM,
//           timeInSecForIosWeb: 1,
//           backgroundColor: Colors.red,
//           textColor: Colors.white,
//           fontSize: 16.0);
//     }
//   } catch (e) {}
// }
//
// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     appBar: AppBar(
//       title: const Text('Face Recognition'),
//       toolbarHeight: 70,
//       centerTitle: true,
//     ),
//     body: Container(
//       margin: const EdgeInsets.only(left: 16.0, right: 16.0),
//       child: Column(
//         children: <Widget>[
//           const Card(
//               color: Color.fromARGB(255, 0x49, 0x45, 0x4F),
//               child: ListTile(
//                 leading: Icon(Icons.tips_and_updates),
//                 subtitle: Text(
//                   'KBY-AI offers SDKs for face recognition, liveness detection, and id document recognition.',
//                   style: TextStyle(fontSize: 13),
//                 ),
//               )),
//           const SizedBox(
//             height: 6,
//           ),
//           Row(
//             children: <Widget>[
//               Expanded(
//                 flex: 1,
//                 child: ElevatedButton.icon(
//                     label: const Text('Enroll'),
//                     icon: const Icon(
//                       Icons.person_add,
//                       // color: Colors.white70,
//                     ),
//                     style: ElevatedButton.styleFrom(
//                         padding: const EdgeInsets.only(top: 10, bottom: 10),
//                         // foregroundColor: Colors.white70,
//                         backgroundColor:
//                         Theme.of(context).colorScheme.primaryContainer,
//                         shape: const RoundedRectangleBorder(
//                           borderRadius:
//                           BorderRadius.all(Radius.circular(12.0)),
//                         )),
//                     onPressed: enrollPerson),
//               ),
//               const SizedBox(width: 20),
//               Expanded(
//                 flex: 1,
//                 child: ElevatedButton.icon(
//                     label: const Text('Identify'),
//                     icon: const Icon(
//                       Icons.person_search,
//                     ),
//                     style: ElevatedButton.styleFrom(
//                         padding: const EdgeInsets.only(top: 10, bottom: 10),
//                         backgroundColor:
//                         Theme.of(context).colorScheme.primaryContainer,
//                         shape: const RoundedRectangleBorder(
//                           borderRadius:
//                           BorderRadius.all(Radius.circular(12.0)),
//                         )),
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => FaceRecognitionView(
//                               personList: widget.personList,
//                             )),
//                       );
//                     }),
//               ),
//             ],
//           ),
// const SizedBox(height: 6),
// Row(
//   children: <Widget>[
//     Expanded(
//       flex: 1,
//       child: ElevatedButton.icon(
//           label: const Text('Settings'),
//           icon: const Icon(
//             Icons.settings,
//           ),
//           style: ElevatedButton.styleFrom(
//               padding: const EdgeInsets.only(top: 10, bottom: 10),
//               backgroundColor:
//               Theme.of(context).colorScheme.primaryContainer,
//               shape: const RoundedRectangleBorder(
//                 borderRadius:
//                 BorderRadius.all(Radius.circular(12.0)),
//               )),
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                   builder: (context) => SettingsPage(
//                     homePageState: this,
//                   )),
//             );
//           }),
//     ),
//     const SizedBox(width: 20),
//     Expanded(
//       flex: 1,
//       child: ElevatedButton.icon(
//           label: const Text('About'),
//           icon: const Icon(
//             Icons.info,
//           ),
//           style: ElevatedButton.styleFrom(
//               padding: const EdgeInsets.only(top: 10, bottom: 10),
//               backgroundColor:
//               Theme.of(context).colorScheme.primaryContainer,
//               shape: const RoundedRectangleBorder(
//                 borderRadius:
//                 BorderRadius.all(Radius.circular(12.0)),
//               )),
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                   builder: (context) => const AboutPage()),
//             );
//           }),
//     ),
//   ],
// ),
//         const SizedBox(
//           height: 8,
//         ),
//         Expanded(
//             child: Stack(
//               children: [
//                 PersonView(
//                   personList: widget.personList,
//                   homePageState: this,
//                 ),
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     Visibility(
//                         visible: _visibleWarning,
//                         child: Container(
//                           width: double.infinity,
//                           height: 40,
//                           color: Colors.redAccent,
//                           child: Center(
//                             child: Text(
//                               _warningState,
//                               textAlign: TextAlign.center,
//                               style: const TextStyle(fontSize: 20),
//                             ),
//                           ),
//                         ))
//                   ],
//                 )
//               ],
//             )),
//         const SizedBox(
//           height: 4,
//         ),
//         const Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image(
//               image: AssetImage('assets/ic_kby.png'),
//               width: 48,
//             ),
//             SizedBox(width: 4),
//             Text('KBY-AI Technology',
//                 style: TextStyle(
//                   fontSize: 18,
//                   color: Color.fromARGB(255, 60, 60, 60),
//                 ))
//           ],
//         ),
//         const SizedBox(height: 4),
//       ],
//     ),
//   ),
// );
// }
// }
