import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sit_eat_web/app/data/model/restaurant_model.dart';

class RestaurantRepository {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Retorna restaurante pelo ID
  Future<RestaurantModel?> getRestaurant(String id) async {
    try {
      DocumentSnapshot doc =
          await _firestore.collection("restaurants").doc(id).get();
      RestaurantModel restaurant = RestaurantModel.fromSnapshot(doc);
      restaurant.id = id;
      return restaurant;
    } catch (e) {
      Get.defaultDialog(
          title: "ERROR", content: Text("Restaurante não encontrado."));
      return null;
    }
  }

  Future<String?> registerNewRestaurant(RestaurantModel newRestaurant) async {
    try {
      var reservationId = await _firestore.collection("restaurants").add(
        {
          "address": newRestaurant.address,
          "capacity": newRestaurant.capacity,
          "openTime": newRestaurant.openTime,
          "closeTime": newRestaurant.closeTime,
          "image": newRestaurant.image,
          "menu": newRestaurant.menu,
          "name": newRestaurant.name,
          "active": false,
        },
      );

      return reservationId.id;
    } catch (e) {
      Get.defaultDialog(
          title: "ERROR", content: Text("Erro ao cadastrar restaurante."));
      return null;
    }
  }
}
