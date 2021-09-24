import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class UtilService extends GetxService {
  showErrorMessage(String title, String message) {
    return Get.snackbar(
      title,
      message,
      maxWidth: 500.0,
      colorText: Colors.white,
      backgroundColor: Colors.red[400],
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 5),
      icon: Icon(Icons.error, color: Colors.white),
      shouldIconPulse: true,
    );
  }

  showInformationMessage(String title, String message) {
    return Get.snackbar(
      title,
      message,
      maxWidth: 500.0,
      colorText: Colors.black,
      backgroundColor: Colors.yellow[700],
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 5),
      icon: Icon(Icons.info, color: Colors.black),
    );
  }

  showSuccessMessage(String title, String message) {
    return Get.snackbar(
      title,
      message,
      maxWidth: 500.0,
      colorText: Colors.white,
      backgroundColor: Colors.green,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 5),
      icon: Icon(Icons.done_rounded, color: Colors.white),
      shouldIconPulse: true,
    );
  }

  showLoader() {
    Get.dialog(
      Center(
        child: CircularProgressIndicator(
          color: Colors.red,
          strokeWidth: 3.5,
        ),
      ),
      barrierDismissible: false,
    );
  }

  Timestamp convertStringToTimestamp(String hour) {
    var date = DateTime.parse("2020-01-15 " + hour + ":00");
    return Timestamp.fromDate(date);
  }

  String convertTimeStampToString(Timestamp timestamp) {
    return DateFormat.Hm().format(timestamp.toDate());
  }
}
