import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sit_eat_web/app/data/model/enum/reservation_status_enum.dart';

class ReservationModel {
  String? id;
  Timestamp? checkIn;
  int? occupationQty;
  String? restaurantId;
  ReservationStatus? status;
  String? userId;

  ReservationModel({
    this.id,
    this.checkIn,
    this.occupationQty,
    this.restaurantId,
    this.status,
    this.userId,
  });

  ReservationModel.fromSnapshot(DocumentSnapshot reservation)
      : id = reservation.id,
        checkIn = reservation["checkin"],
        occupationQty = reservation["occupationQty"],
        restaurantId = reservation["restaurantId"],
        status = ReservationStatus.values
            .where((status) => status.toUpper == reservation["status"])
            .first,
        userId = reservation["userId"];
}
