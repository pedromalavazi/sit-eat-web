import 'package:cloud_firestore/cloud_firestore.dart';

class BillModel {
  String? id;
  bool? asked;
  bool? paid;
  String? paymentType;
  double? reservationId;
  double? total;

  BillModel({
    this.id,
    this.asked,
    this.paid,
    this.paymentType,
    this.total,
  });

  BillModel.fromSnapshot(DocumentSnapshot bill)
      : id = bill.id,
        asked = bill["asked"],
        paid = bill["paid"],
        paymentType = bill["paymentType"],
        reservationId = bill["reservationId"],
        total = bill["total"];
}
