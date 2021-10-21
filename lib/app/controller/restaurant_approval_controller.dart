import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sit_eat_web/app/data/model/restaurant_model.dart';
import 'package:sit_eat_web/app/data/services/restaurant_service.dart';
import 'package:sit_eat_web/app/data/services/util_service.dart';
import 'package:sit_eat_web/utils/web_utils.dart';

class RestaurantApprovalController extends GetxController {
  final RestaurantService _restaurantService = RestaurantService();
  final UtilService _utilService = UtilService();

  String restaurantId = Get.arguments;
  Rx<RestaurantModel> restaurant = RestaurantModel().obs;
  final TextEditingController nameTextController = TextEditingController();
  final TextEditingController addressTextController = TextEditingController();
  final TextEditingController openTimeTextController = TextEditingController();
  final TextEditingController closeTimeTextController = TextEditingController();
  final TextEditingController capacityTextController = TextEditingController();

  @override
  void onInit() {
    getRestaurant();
    super.onInit();
  }

  void getRestaurant() async {
    restaurant.value = await _restaurantService.getById(restaurantId);
    nameTextController.text = restaurant.value.name ?? "";
    addressTextController.text = restaurant.value.address ?? "";
    openTimeTextController.text = getHour(restaurant.value.openTime ?? null);
    closeTimeTextController.text = getHour(restaurant.value.closeTime ?? null);
    capacityTextController.text = restaurant.value.capacity == null ? "0" : restaurant.value.capacity.toString();
  }

  void approve() async {
    bool success = await _restaurantService.activateRestaurant(restaurantId);

    if (success) {
      Get.back();
      _utilService.showSuccessMessage("Sucesso", "Restaurante ativado com sucesso!.");
    }
  }

  void disapprove() async {
    bool success = await _restaurantService.deactivateRestaurant(restaurantId);

    if (success) {
      Get.back();
      _utilService.showSuccessMessage("Sucesso", "Restaurante desativado com sucesso!.");
    }
  }

  getHour(Timestamp? timestamp) {
    if (timestamp == null) return "";
    return getHourFromTimeStamp(timestamp);
  }
}
