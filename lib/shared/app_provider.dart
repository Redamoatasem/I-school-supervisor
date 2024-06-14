import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tracker_login_register/Network/local/cache_helper.dart';

class AppProvider extends ChangeNotifier {
  Future<dynamic> changePassword(String password) async {
    var user = await FirebaseAuth.instance.currentUser!;
    user.updatePassword(password).then((_) {
      print('Successfully changed password');
    }).catchError((error) {
      print("Password can't be changed" + error.toString());
    });
  }

  // Future<String> signUp(String email, String password) async {
  //   try {
  //     final credential =
  //         await FirebaseAuth.instance.createUserWithEmailAndPassword(
  //       email: email,
  //       password: password,
  //     );
  //     return 'Done';
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'weak-password') {
  //       return 'The password provided is too weak';
  //     } else if (e.code == 'email-already-in-use') {
  //       return 'The account already exists for that email';
  //     }
  //     return 'Something went wrong';
  //   } catch (e) {
  //     print(e);
  //     return 'Something went wrong';
  //   }
  // }

  Future<String> signUp(String email, String password, String confirmPassword, String firstname, String lastname,String phoneNumber) async {
    if (password == confirmPassword) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        // Update the username and phone number
        await userCredential.user!.updateDisplayName(firstname);
        await userCredential.user!.updateDisplayName(lastname);
        await userCredential.user!.reload();

        // Update the phone number
        await FirebaseAuth.instance.verifyPhoneNumber(
          phoneNumber: phoneNumber,
          verificationCompleted: (PhoneAuthCredential credential) async {
            // Auto-retrieval or instant verification completed
            await userCredential.user!.updatePhoneNumber(credential);
          },
          verificationFailed: (FirebaseAuthException e) {
            print('Phone number verification failed. Code: ${e.code}. Message: ${e.message}');
          },
          codeSent: (String verificationId, int? resendToken) {
            // SMS code sent
          },
          codeAutoRetrievalTimeout: (String verificationId) {
            // Auto-retrieval time out
          },
        );

        // User created successfully
        return 'User signed up ';
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          return 'The password provided is too weak.';
        } else if (e.code == 'email-already-in-use') {
          return 'The account already exists for that email.';
        }
      } catch (e) {
        print(e);
      }
    } else {
      return 'Passwords do not match.';
    }
    return 'Done';
  }

  Future<String> signIn(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      await CacheHelper.saveData(key: 'isLogged', value: credential.user!.uid);
      print('User ID saved: ${credential.user!.uid}');
      return 'Done';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'No user found for that email';
      } else if (e.code == 'wrong-password') {
        return 'Wrong password provided for that user';
      }
      return 'Something went wrong';
    }
  }

  // Future<String> verifyWithPhone(String phone) async {
  //   try {
  //     final credential =
  //     await FirebaseAuth.instance.signInWithPhoneNumber(
  //       phone
  //     );
  //     return 'Done';
  //   } catch(e){
  //     return 'Something went wrong';
  //   }
  // }
}
