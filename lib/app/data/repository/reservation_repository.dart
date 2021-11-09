import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sit_eat_web/app/data/model/reservation_model.dart';

class ReservationRepository {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<ReservationModel>> getReservations(String restaurantId) async {
    List<ReservationModel> reservations = <ReservationModel>[];

    try {
      var reservationsDocs = await _firestore.collection("restaurants/$restaurantId/tables").get();
      if (reservationsDocs.docs.isEmpty) return reservations;

      reservationsDocs.docs.forEach((tableDoc) {
        reservations.add(ReservationModel.fromSnapshot(tableDoc));
      });

      return reservations;
    } catch (e) {
      Get.defaultDialog(title: "ERROR", content: Text("Mesas não encontradas."));
      return reservations;
    }
  }
}
