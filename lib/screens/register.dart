import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tracker_login_register/screens/home.dart';
import 'package:tracker_login_register/shared/app_provider.dart';
import '../shared/components.dart';
import '../shared/constant.dart';
import '../shared/email_validator.dart';
import '../shared/utils.dart';
import 'login.dart';

class Register extends StatefulWidget {
  static const String routeName = 'register';

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool isPassword = true;
  Uint8List? image;

  void selectImage() async {
    Uint8List img = await StoreData.saveData(file: image!);
    setState(() {
      image = img;
    });
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    var passwordController = TextEditingController();
    var confirmPasswordController = TextEditingController();
    var emailController = TextEditingController();
    var phoneController = TextEditingController();
    var firstNameController = TextEditingController();
    var lastNameController = TextEditingController();
    var formValidate = GlobalKey<FormState>();
    return Container(
      color: thirdColor,
      child: Stack(
        children: [
          Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
              child: Form(
                key: formValidate,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset('assets/logo.png'),
                      //SizedBox(height: 3,),
                      //Text('i School Bus',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          right: 200,
                        ),
                        child: Text(
                          'Create Account',
                          style: TextStyle(
                              color: primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0),
                        ),
                      ),
                      // SizedBox(height: 1.0,),
                      // Padding(padding: EdgeInsets.only(right: 265,),child: Text('Account',style: TextStyle(color: primaryColor,fontWeight: FontWeight.bold,fontSize: 20.0),),),
                      SizedBox(
                        height: 15.0,
                      ),
                      // Padding(
                      //   padding: EdgeInsets.only(right: 300),
                      //   child: Text(
                      //     'User Name',
                      //     style: TextStyle(fontSize: 15,color: Colors.white),
                      //   ),
                      // ),
                      image != null
                          ? Padding(
                              padding: EdgeInsets.all(10.0),
                              child: CircleAvatar(
                                radius: 65,
                                backgroundImage: MemoryImage(image!),
                              ),
                            )
                          : Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Stack(
                                children: [
                                  CircleAvatar(
                                    radius: 65,
                                    backgroundImage: NetworkImage('url'),
                                  ),
                                  Positioned(
                                      child: IconButton(
                                          onPressed: () {
                                            selectImage();
                                          },
                                          icon: Icon(Icons.add_a_photo)))
                                ],
                              ),
                            ),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: defaultFormField(
                            onChange: (value) => print(value),
                            onSubmit: (value) => print(value),
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return 'first name is required';
                              }
                              return null;
                            },
                            controller: firstNameController,
                            type: TextInputType.name,
                            label: 'Enter Your First Name'),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: defaultFormField(
                            onChange: (value) => print(value),
                            onSubmit: (value) => print(value),
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return 'last name is required';
                              }
                              return null;
                            },
                            controller: lastNameController,
                            type: TextInputType.name,
                            label: 'Enter Your Last Name'),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      // Padding(
                      //   padding: EdgeInsets.only(right: 300),
                      //   child: Text(
                      //     'Email Address',
                      //     style: TextStyle(fontSize: 15,color: Colors.white),
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 8.0,
                      // ),
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
                        height: 8.0,
                      ),
                      // Padding(
                      //   padding: EdgeInsets.only(right: 300),
                      //   child: Text(
                      //     'Number',
                      //     style: TextStyle(fontSize: 15,color: Colors.white),
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 8.0,
                      // ),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: defaultFormField(
                            onChange: (value) => print(value),
                            onSubmit: (value) => print(value),
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return 'phone number is required';
                              }
                              return null;
                            },
                            controller: phoneController,
                            type: TextInputType.phone,
                            label: 'Enter Your Phone Number'),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      // Padding(
                      //   padding: EdgeInsets.only(right: 300),
                      //   child: Text(
                      //     'Password',
                      //     style: TextStyle(fontSize: 15,color: Colors.white),
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 8.0,
                      // ),
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
                        height: 80,
                      ),
                      defaultButton(
                          textStyle: Colors.black,
                          background: primaryColor,
                          function: () async {
                            if (formValidate.currentState!.validate()) {
                              print(firstNameController.text);
                              print(lastNameController.text);
                              print(emailController.text);
                              print(passwordController.text);
                              print(confirmPasswordController.text);
                              print(phoneController.text);
                              var message = await provider.signUp(
                                  emailController.text,
                                  passwordController.text,
                                  confirmPasswordController.text,
                                  firstNameController.text,
                                  lastNameController.text,
                                  phoneController.text);
                              //var m = await provider.verifyWithPhone(phoneController.text);
                              if (message == 'Done') {
                                Navigator.pushNamedAndRemoveUntil(
                                    context, Home.routeName, (route) => false);
                              } else {
                                DialogUtils.showDialogMessage(context, message);
                              }
                            }
                          },
                          text: 'Sign up'),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Back to',
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, Login.routeName);
                            },
                            child: const Text(
                              'Login',
                              style: TextStyle(
                                color: Color(0xfff2ba52),
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
          ),
        ],
      ),
    );
  }
}
