import 'package:flutter/material.dart';
import 'package:tracker_login_register/Network/local/cache_helper.dart';
import 'package:tracker_login_register/screens/login.dart';
import 'package:tracker_login_register/screens/profile.dart';
import 'package:tracker_login_register/screens/support.dart';
import 'package:tracker_login_register/shared/constant.dart';
import 'bus_info.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});
  static const String routeName = 'setting';
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: thirdColor,
          child: Scaffold(
            backgroundColor: Color(0xff071a26),
              body: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 55,
                  ),
                  InkWell(
                    onTap: () =>
                        Navigator.pushNamed(context, Profile.routeName),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 10.0,
                        ),
                        Image.asset(
                          'assets/ic_profile.PNG',
                          width: 50,
                          height: 50,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          'Profile',
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  InkWell(
                    onTap: () =>
                        Navigator.pushNamed(context, Support.routeName),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 10.0,
                        ),
                        Image.asset(
                          'assets/support.PNG',
                          width: 50,
                          height: 50,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          'Support',
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  InkWell(
                    onTap: () =>
                        Navigator.pushNamed(context, BusInfo.routeName),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 10.0,
                        ),
                        Image.asset(
                          'assets/ic_bus_info.PNG',
                          width: 50,
                          height: 50,
                        ),
                        SizedBox(width: 15),
                        Text(
                          'Bus Info',
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 450.0,
                  ),
                  InkWell(
                    onTap: () => Navigator.pushNamedAndRemoveUntil(
                        context, Login.routeName, (route) => false),
                    child: InkWell(
                      onTap: () {
                        CacheHelper.removeData(key: 'isLogged');
                        Navigator.pushNamedAndRemoveUntil(
                            context, Login.routeName, (route) => false);
                      },
                      child: Row(
                        children: [
                          SizedBox(
                            width: 15.0,
                          ),
                          Text(
                            'Log Out',
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Image.asset(
                            'assets/ic_log_out.PNG',
                            width: 50,
                            height: 50,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
            ),)
          ),
      ],
    );
  }
}
