import 'package:cloud_firestore/cloud_firestore.dart';

class OrderModel {
  String? id;
  String? userId;
  Timestamp? orderTime;
  String? productId;
  int? quantity;
  String? reservationId;
  double? total;
  bool? delivered;

  OrderModel({
    this.id,
    this.orderTime,
    this.productId,
    this.quantity,
    this.reservationId,
    this.total,
    this.delivered,
  });

  OrderModel.fromSnapshot(DocumentSnapshot order)
      : id = order.id,
        orderTime = order["orderTime"],
        productId = order["productId"],
        quantity = order["quantity"],
        reservationId = order["reservationId"],
        delivered = order["delivered"];
}
