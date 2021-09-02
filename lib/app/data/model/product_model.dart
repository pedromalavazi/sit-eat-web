import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  String? id;
  String? restaurantId;
  String? image;
  String? name;
  double? price;
  String? description;

  ProductModel({
    this.id,
    this.restaurantId,
    this.image,
    this.name,
    this.price,
    this.description,
  });

  ProductModel.fromSnapshot(DocumentSnapshot product)
      : id = product.id,
        restaurantId = product["restaurantId"],
        image = product["image"],
        name = product["name"],
        price = double.parse(product["price"]),
        description = product["description"];

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "restaurantId": restaurantId,
      "image": image,
      "name": name,
      "price": price,
      "description": description,
    };
  }
}
