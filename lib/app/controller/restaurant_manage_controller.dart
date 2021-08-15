import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sit_eat_web/app/data/model/restaurant_model.dart';
import 'package:sit_eat_web/app/data/services/restaurant_management_service.dart';

class RestaurantManagementController extends GetxController {
  final RestaurantManagementService _restaurantManageService =
      RestaurantManagementService();

  final TextEditingController restaurantNameTextController =
      TextEditingController();
  Rx<bool?> activeFilter = null.obs;
  RxList<RestaurantModel> listRestaurants = <RestaurantModel>[].obs;

  @override
  void onInit() {
    getRestaurants();
    super.onInit();
  }

  void getRestaurants() async {
    String restaurantName = restaurantNameTextController.text.trim();

    listRestaurants.value = await _restaurantManageService.getToManage(
        activeFilter.value, restaurantName);
  }
}
