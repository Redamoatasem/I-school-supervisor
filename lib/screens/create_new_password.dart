import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tracker_login_register/screens/forgot_password.dart';
import '../shared/app_provider.dart';
import '../shared/components.dart';
import '../shared/constant.dart';
import '../shared/utils.dart';
import 'otp_verification.dart';

class CreateNewPassword extends StatefulWidget {
  CreateNewPassword({super.key});

  static const String routeName = 'create';

  @override
  State<CreateNewPassword> createState() => _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<CreateNewPassword> {
  bool isPassword = true;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    var passwordController = TextEditingController();
    var confirmPasswordController = TextEditingController();
    var formValidate = GlobalKey<FormState>();
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
                    Navigator.pushNamed(context, ForgotPassword.routeName),
              ),
            ),
            backgroundColor: Colors.transparent,
            body: Form(
              key: formValidate,
              child: SingleChildScrollView(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/create_new_password.png',
                    width: double.infinity,
                    height: 400,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '  Create New Password',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '    Please enter your new password',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: defaultFormField(
                      controller: passwordController,
                      type: TextInputType.visiblePassword,
                      isPassword: isPassword,
                      suffix: isPassword == true
                          ? Icons.visibility_off
                          : Icons.visibility,
                      onChange: (String value) => print(value),
                      onSubmit: (String value) => print(value),
                      validate: (String? value) {
                        if (value!.isEmpty) {
                          return 'password is required';
                        }
                        if (value.length < 6) {
                          return 'password should at least 6 characters';
                        }
                        return null;
                      },
                      label: 'Enter your password',
                      suffixPressed: () {
                        isPassword = !isPassword;
                        setState(() {});
                      },
                    ),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  // Padding(
                  //   padding: EdgeInsets.only(right: 300),
                  //   child: Text(
                  //     'Confirm Password',
                  //     style: TextStyle(fontSize: 15,color: Colors.white),
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 8.0,
                  // ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: defaultFormField(
                      controller: confirmPasswordController,
                      type: TextInputType.visiblePassword,
                      isPassword: isPassword,
                      suffix: isPassword == true
                          ? Icons.visibility_off
                          : Icons.visibility,
                      onChange: (String value) => print(value),
                      onSubmit: (String value) => print(value),
                      validate: (String? value) {
                        if (value!.isEmpty) {
                          return 'confirming a password is required';
                        }
                        if (passwordController.text != value) {
                          return 'password doesn\'t match';
                        }
                        return null;
                      },
                      label: 'Enter a confirm password',
                      suffixPressed: () {
                        isPassword = !isPassword;
                        setState(() {});
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 40,
                    ),
                    child: defaultButton(
                        textStyle: Colors.black,
                        background: primaryColor,
                        function: () async {
                          if (formValidate.currentState!.validate()) {
                            print(passwordController.text);
                            var message = await provider
                                .changePassword(passwordController.text);
                            //var m = await provider.verifyWithPhone(phoneController.text);
                            if (message == true) {
                              Navigator.pushNamed(
                                  context, OtpVerification.routeName);
                            } else {
                              DialogUtils.showDialogMessage(
                                  context, 'Please enter a new password');
                            }
                          }
                        },
                        text: 'Create'),
                  ),
                ],
              )),
            ),
          ),
        ],
      ),
    );
  }
}
