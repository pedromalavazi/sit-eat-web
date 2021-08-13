import 'package:cloud_firestore/cloud_firestore.dart';

class OrderItemModel {
  String? id;
  String? orderId;
  String? productId;
  bool? quantity;
  double? price;

  OrderItemModel({
    this.id,
    this.orderId,
    this.productId,
    this.quantity,
    this.price,
  });

  OrderItemModel.fromSnapshot(DocumentSnapshot orderItem)
      : id = orderItem.id,
        orderId = orderItem["orderId"],
        productId = orderItem["productId"],
        quantity = orderItem["quantity"],
        price = orderItem["price"];
}
