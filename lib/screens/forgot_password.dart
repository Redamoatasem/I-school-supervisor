import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tracker_login_register/screens/login.dart';
import '../shared/app_provider.dart';
import '../shared/components.dart';
import '../shared/constant.dart';
import '../shared/email_validator.dart';
import 'create_new_password.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  static const String routeName = 'forgot-password';

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
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
                onPressed: () => Navigator.pushNamed(context, Login.routeName),
              ),
            ),
            backgroundColor: Colors.transparent,
            body: Form(
              key: formValidate,
              child: SingleChildScrollView(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/forgot_password.png',
                    width: double.infinity,
                    height: 400,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '  Forgot Password',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '    Don\'t worry it happens . please enter the email',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    '    to which we will send the password OTP',
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
                        onChange: (value) => print(value),
                        onSubmit: (value) => print(value),
                        validate: (String? value) {
                          if (value!.isEmpty) {
                            return 'email is required';
                          }
                          if (!isValidEmail(value)) {
                            return 'email bad format';
                          }
                          return null;
                        },
                        controller: emailController,
                        type: TextInputType.emailAddress,
                        label: 'Enter Your Email'),
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
                      function: () {
                        if (formValidate.currentState!.validate()) {
                          print(emailController.text);
                          Navigator.pushNamed(
                              context, CreateNewPassword.routeName);
                        }
                        if (emailController.text.isEmpty) {
                          return 'email is required';
                        }
                        if (!isValidEmail(emailController.text)) {
                          return 'email bad format';
                        }
                        return null;
                      },
                      text: 'Enter',
                    ),
                  ),
                ],
              )),
            ),
          )
        ],
      ),
    );
  }
}
