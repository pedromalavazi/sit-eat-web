import 'package:cloud_firestore/cloud_firestore.dart';

class ReservationModel {
  String? userId;
  String? status;
  String? restaurantId;
  int? occupationQty;
  Timestamp? checkin;

  ReservationModel({
    this.userId,
    this.status,
    this.restaurantId,
    this.occupationQty,
    this.checkin,
  });

  ReservationModel.fromSnapshot(DocumentSnapshot reservation)
      : userId = reservation.id,
        status = reservation["status"],
        restaurantId = reservation["restaurantId"],
        occupationQty = reservation["occupationQty"],
        checkin = reservation["checkin"];
}
