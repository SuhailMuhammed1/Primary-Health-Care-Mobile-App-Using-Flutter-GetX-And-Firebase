import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:phc_lab/core/app_export.dart';

class ViewLabReportController extends GetxController {

  final CollectionReference lab = FirebaseFirestore.instance.collection('user').doc(FirebaseAuth.instance.currentUser?.uid).collection('lab');
  RxBool isDescendingOrder = false.obs;

  void toggleSortingOrder() {
    isDescendingOrder.value = !isDescendingOrder.value;
  }

  void deleteReport(String docId) {
    lab.doc(docId).delete();
    Get.snackbar('Deleted',
        'Lab report deleted successfully.',
        backgroundColor: Colors.green,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        margin: EdgeInsets.all(5));
  }

}