import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tracker_login_register/screens/create_new_password.dart';
import 'package:tracker_login_register/screens/today_trip.dart';
import '../shared/app_provider.dart';
import '../shared/components.dart';
import '../shared/constant.dart';
import '../shared/email_validator.dart';

class OtpVerification extends StatelessWidget {
  const OtpVerification({super.key});

  static const String routeName = 'otp-verify';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: thirdColor,
      child: Stack(
        children: [
          Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  onPressed: () =>
                      Navigator.pushNamed(context, CreateNewPassword.routeName),
                ),
              ),
              backgroundColor: Colors.transparent,
              body: Column(
                children: [
                  Image.asset('assets/otp_verification.png'),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'OTP Verification                          ',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '         We will send you one of the time password this               ',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    'email address. (Ahmed123@gmail.com)              ',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 100,
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Color(0xffc1cbd1),
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                10,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Color(0xffc1cbd1),
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                10,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Color(0xffc1cbd1),
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                10,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Color(0xffc1cbd1),
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                10,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  defaultButton(
                    textStyle: Colors.black,
                    background: primaryColor,
                    function: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, TodayTrip.routeName, (route) => false);
                    },
                    text: 'Enter',
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
