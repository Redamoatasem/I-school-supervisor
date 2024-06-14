import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseStorage storage = FirebaseStorage.instance;
final FirebaseFirestore firestore = FirebaseFirestore.instance;

class StoreData {
  static Future<String> uploadImageToStorage(
      String childName, Uint8List file) async {
    Reference ref = storage.ref().child(childName).child('id');
    UploadTask uploadTask = ref.putData(file);
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  static Future saveData({
    // required String name,
    // required String bio,
    required Uint8List file,
  }) async {
    String resp = 'Some Error Occurred';
    try {
      if (file.isNotEmpty) {
        String imageUrl = await uploadImageToStorage('profileImage', file);
        await firestore.collection('userProfile').add({
          // 'name': name,
          // 'bio': bio,
          'imageLink': imageUrl,
        });
        resp = 'success';
      }
    } catch (err) {
      resp = err.toString();
    }
    return resp;
  }
}

class DialogUtils {
  static void showDialogMessage(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(message),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: Text('ok'))
        ],
      ),
    );
  }
}