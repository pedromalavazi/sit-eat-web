import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  String? id;
  String? restaurantId;
  String? image;
  String? name;
  double? price;
  String? description;
  String? measure;

  ProductModel({
    this.id,
    this.restaurantId,
    this.image,
    this.name,
    this.price,
    this.description,
    this.measure,
  });

  ProductModel.fromSnapshot(DocumentSnapshot product)
      : id = product.id,
        restaurantId = product["restaurantId"],
        image = product["image"],
        name = product["name"],
        price = product["price"],
        measure = product["measure"],
        description = product["description"];

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "restaurantId": restaurantId,
      "image": image,
      "name": name,
      "price": price,
      "measure": measure,
      "description": description,
    };
  }
}
