import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:tracker_login_register/shared/constant.dart';
import 'home.dart';
import 'notification.dart';

class Support extends StatelessWidget {
  const Support({super.key});

  static const String routeName = 'support';
  static const String phoneNumber = '01006391255';

  void _launchPhoneDialer(BuildContext context) async {
    final Uri url = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Could not launch phone dialer'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        color: thirdColor,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.all(11.4),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(23),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color(0xffc2ccd2),
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                    ),
                    width: 396,
                    height: 66.0,
                    child: Row(
                      children: [
                        const SizedBox(width: 10.0),
                        InkWell(
                          child: Image.asset(
                            'assets/supervisor_logo.png',
                            height: 40,
                            width: 40,
                          ),
                          onTap: () =>
                              Navigator.pushNamed(context, Home.routeName),
                        ),
                        const SizedBox(width: 80.0),
                        const Text(
                          'Support',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        Stack(
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 25,
                                vertical: 10,
                              ),
                              child: CircleAvatar(
                                backgroundColor: Colors.red,
                                radius: 3.0,
                              ),
                            ),
                            IconButton(
                              onPressed: () =>
                                  Navigator.pushNamed(context, Notifications.routeName),
                              icon: const Icon(
                                Icons.notifications_none,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 15.0),
                Image.asset('assets/how_can_we_help_you_today.png'),
                const SizedBox(height: 60.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.phone,
                      size: 30.0,
                      color: Colors.white,
                    ),
                    SizedBox(width: 20.0),
                    InkWell(
                      onTap: () => _launchPhoneDialer(context),
                      child: Text(
                        phoneNumber,
                        style: const TextStyle(
                          fontSize: 20.0,
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ]);
  }
}
