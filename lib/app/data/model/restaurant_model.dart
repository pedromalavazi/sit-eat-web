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
  String? number;
  String? zipCode;
  String? state;
  String? city;
  bool? active;

  RestaurantModel({
    this.id,
    this.image,
    this.name,
    this.address,
    this.number,
    this.state,
    this.zipCode,
    this.city,
    this.capacity,
    this.openTime,
    this.closeTime,
    this.menu,
    this.active,
  });

  RestaurantModel.fromSnapshot(DocumentSnapshot restaurant)
      : id = restaurant.id,
        image = restaurant["image"],
        name = restaurant["name"],
        address = restaurant["address"],
        capacity = restaurant["capacity"],
        openTime = restaurant["openTime"],
        closeTime = restaurant["closeTime"],
        number = restaurant["number"],
        zipCode = restaurant["zipCode"],
        city = restaurant["city"],
        state = restaurant["state"],
        menu = restaurant["menu"],
        active = restaurant["active"];
}
