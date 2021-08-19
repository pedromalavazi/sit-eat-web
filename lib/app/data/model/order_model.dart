import 'package:cloud_firestore/cloud_firestore.dart';

class OrderModel {
  String? id;
  DateTime? orderTime;
  bool? productId;
  int? quantity;
  String? reservationId;
  double? total;

  OrderModel({
    this.id,
    this.orderTime,
    this.productId,
    this.quantity,
    this.reservationId,
    this.total,
  });

  OrderModel.fromSnapshot(DocumentSnapshot order)
      : id = order.id,
        orderTime = order["orderTime"],
        productId = order["productId"],
        quantity = order["quantity"],
        reservationId = order["reservationId"],
        total = order["total"];
}
