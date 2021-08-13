import 'package:cloud_firestore/cloud_firestore.dart';

class RestaurantModel {
  String? id;
  String? image;
  String? name;
  String? address;
  int? capacity;
  Timestamp? openTime;
  Timestamp? closeTime;
  String? menu;
  bool? active;

  RestaurantModel(
      {this.id,
      this.image,
      this.name,
      this.address,
      this.capacity,
      this.openTime,
      this.closeTime,
      this.menu,
      this.active});

  RestaurantModel.fromSnapshot(DocumentSnapshot restaurant)
      : id = restaurant.id,
        image = restaurant["image"],
        name = restaurant["name"],
        address = restaurant["address"],
        capacity = restaurant["capacity"],
        openTime = restaurant["openTime"],
        closeTime = restaurant["closeTime"],
        menu = restaurant["menu"],
        active = restaurant["active"];

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "image": image,
      "name": name,
      "address": address,
      "capacity": capacity,
      "openTime": openTime,
      "closeTime": closeTime,
      "menu": menu,
      "active": active,
    };
  }
}
