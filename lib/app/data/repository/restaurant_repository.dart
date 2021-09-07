import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sit_eat_web/app/data/model/restaurant_model.dart';

class RestaurantRepository {
  static const String TABLE = 'restaurants';
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Retorna restaurante pelo ID
  Future<RestaurantModel> getRestaurant(String id) async {
    try {
      DocumentSnapshot doc = await _firestore.collection(TABLE).doc(id).get();
      RestaurantModel restaurant = RestaurantModel.fromSnapshot(doc);
      restaurant.id = id;
      return restaurant;
    } catch (e) {
      Get.defaultDialog(
          title: "ERROR", content: Text("Restaurante não encontrado."));
      return RestaurantModel();
    }
  }

  // Retorna restaurante para controle do ADMIN
  Future<List<RestaurantModel>> getRestaurantToManage(
    bool? active,
    String? name,
  ) async {
    List<RestaurantModel> restaurants = <RestaurantModel>[];
    try {
      //Query<Map<String, dynamic>> query = _firestore.collection(TABLE);
      // if (active != null) query = query.where('active', isEqualTo: active);
      // if (name != null) query = query.where('name', isEqualTo: name);
      // var restaurantsDocs = await query.get();

      var restaurantsDocs = await _firestore.collection(TABLE).get();
      if (restaurantsDocs.docs.isEmpty) return restaurants;

      restaurantsDocs.docs.forEach((restaurantDoc) {
        restaurants.add(RestaurantModel.fromSnapshot(restaurantDoc));
      });

      return restaurants;
    } catch (e) {
      Get.defaultDialog(
          title: "ERROR", content: Text("Restaurante não encontrado."));
      return restaurants;
    }
  }

  Future<String?> registerNewRestaurant(RestaurantModel newRestaurant) async {
    try {
      var restaurant = await _firestore.collection(TABLE).add(
        {
          "address": newRestaurant.address,
          "capacity": newRestaurant.capacity,
          "openTime": newRestaurant.openTime,
          "closeTime": newRestaurant.closeTime,
          "image": newRestaurant.image,
          "menu": newRestaurant.menu,
          "name": newRestaurant.name,
          "number": newRestaurant.number,
          "zipCode": newRestaurant.zipCode,
          "state": newRestaurant.state,
          "city": newRestaurant.city,
          "active": false,
        },
      );

      return restaurant.id;
    } catch (e) {
      Get.defaultDialog(
          title: "ERROR", content: Text("Erro ao cadastrar restaurante."));
      return null;
    }
  }

  Future<bool> updateQrCode(String restaurantId, String qrCode) async {
    try {
      await _firestore.collection(TABLE).doc(restaurantId).update(
        {
          "qrCode": qrCode,
        },
      );
      return true;
    } catch (e) {
      Get.defaultDialog(
          title: "ERROR", content: Text("Erro ao atualizar o restaurante."));
      return false;
    }
  }

  Future<bool> update(RestaurantModel restaurantUpdate) async {
    try {
      await _firestore.collection(TABLE).doc(restaurantUpdate.id).update({
        "address": restaurantUpdate.address,
        "capacity": restaurantUpdate.capacity,
        "city": restaurantUpdate.city,
        "closeTime": restaurantUpdate.closeTime,
        "openTime": restaurantUpdate.openTime,
        // "image": restaurantUpdate.image,
        "menu": restaurantUpdate.menu,
        "name": restaurantUpdate.name,
        "number": restaurantUpdate.number,
        "zipCode": restaurantUpdate.zipCode,
        "state": restaurantUpdate.state,
      });
      return true;
    } catch (e) {
      Get.defaultDialog(
          title: "ERROR", content: Text("Erro ao atualizar o restaurante."));
      return false;
    }
  }

  Future<bool> activateRestaurant(String id) async {
    try {
      CollectionReference restaurants = _firestore.collection('restaurants');
      await restaurants.doc(id).update({'active': true});
      return true;
    } catch (e) {
      Get.defaultDialog(
          title: "ERROR", content: Text("Restaurante não encontrado."));
      return false;
    }
  }

  Future<bool> deactivateRestaurant(String id) async {
    try {
      CollectionReference restaurants = _firestore.collection('restaurants');
      await restaurants.doc(id).update({'active': false});
      return true;
    } catch (e) {
      Get.defaultDialog(
          title: "ERROR", content: Text("Restaurante não encontrado."));
      return false;
    }
  }

  // Retorna restaurante para controle do ADMIN
  Stream<List<RestaurantModel>> listenerRestaurants() {
    return _firestore.collection('restaurants').snapshots().map((doc) {
      if (doc.docs.length == 0) {
        return <RestaurantModel>[];
      }
      return convertRestaurantsFromDB(doc);
    });
  }

  Future delete(String restaurantId) async {
    await _firestore.collection('restaurants').doc(restaurantId).delete();
  }

  List<RestaurantModel> convertRestaurantsFromDB(
      QuerySnapshot restaurantsFromDB) {
    List<RestaurantModel> restaurants = <RestaurantModel>[];
    restaurantsFromDB.docs.forEach((restaurant) {
      restaurants.add(RestaurantModel.fromSnapshot(restaurant));
    });
    return restaurants;
  }
}
