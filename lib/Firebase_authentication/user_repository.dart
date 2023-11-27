import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:phc_lab/Firebase_authentication/user_model.dart';
import 'package:phc_lab/core/app_export.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();
  final _db = FirebaseFirestore.instance;

  createUser(UserModel user) async {
    await _db.collection("user").add(user.toJson()).whenComplete(
            () => Get.snackbar(
                'Success', 'Your account has been created',
                snackPosition: SnackPosition.BOTTOM,
                margin: EdgeInsets.all(5),
                backgroundColor: Colors.green,
                colorText: Colors.white))
        // ignore: body_might_complete_normally_catch_error
        .catchError((error, stackTrace) {
      Get.snackbar('Error', 'Something went wrong. Try again',
          snackPosition: SnackPosition.BOTTOM,
          margin: EdgeInsets.all(5),
          backgroundColor: Colors.red.withOpacity(0.1),
          colorText: Colors.red);
      print(error.toString());
    });
  }

  Future<UserModel> getUserDetails(String email) async {
    final snapshot = await _db
        .collection("user")
        .where("Email", isEqualTo: email)
        .get();
    final userData =
        snapshot.docs.map((e) => UserModel.fromSnapShot(e)).single;
    return userData;
  }

  Future<void> deleteUser(String email) async {
    try {
      final userQuery = await _db
          .collection("user")
          .where("Email", isEqualTo: email)
          .get();

      for (final doc in userQuery.docs) {
        await _db.collection("user").doc(doc.id).delete();
      }

    } catch (error, stackTrace) {
      print('Error deleting user documents: $error');
      print('Stack trace: $stackTrace');
      // Handle the error as needed
    }
  }

}