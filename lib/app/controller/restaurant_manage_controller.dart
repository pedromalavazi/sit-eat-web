import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sit_eat_web/app/data/model/restaurant_model.dart';
import 'package:sit_eat_web/app/data/services/restaurant_service.dart';

class RestaurantManagementController extends GetxController {
  final RestaurantService _restaurantService = RestaurantService();
  var scaffoldKey = GlobalKey<ScaffoldState>();
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

    listRestaurants.value = await _restaurantService.getToManage(
        activeFilter.value, restaurantName);
  }

  void openDrawer() {
    scaffoldKey.currentState!.openDrawer();
  }

  void closeDrawer() {
    scaffoldKey.currentState!.openEndDrawer();
  }
}
