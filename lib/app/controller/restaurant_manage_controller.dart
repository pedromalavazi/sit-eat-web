import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sit_eat_web/app/data/model/restaurant_model.dart';
import 'package:sit_eat_web/app/data/services/restaurant_service.dart';

class RestaurantManagementController extends GetxController {
  final RestaurantService _restaurantService = RestaurantService();
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
    _restaurantService.listenerRestaurants().listen((restaurantsFromDB) async {
      listRestaurants.clear();
      listRestaurants.value = filterRestaurants(restaurantsFromDB);
    });
  }

  // Filtra os restaurantes
  List<RestaurantModel> filterRestaurants(List<RestaurantModel> listRest) {
    List<RestaurantModel> restaurants = <RestaurantModel>[];

    if (filterActiveIsFilled())
      listRest.removeWhere((element) => element.active != activeFilter.value);

    if (filterNameRestaurantIsFilled()) {
      String restaurantFilterName = restaurantNameTextController.text.trim();
      listRest = listRest
          .where((rest) => rest.name!.contains(restaurantFilterName))
          .toList();
    }

    return restaurants;
  }

  // Verifica se os filtros estão preenchidos
  bool filtersIsFilled() {
    if (filterActiveIsFilled()) return true;
    if (filterNameRestaurantIsFilled()) return true;
    return false;
  }

  // Verifica se o filtro "Ativo" está preenchido
  bool filterActiveIsFilled() {
    if (activeFilter.value != null) return true;
    return false;
  }

  // Verifica se o filtro "Restaurant Name" está preenchido
  bool filterNameRestaurantIsFilled() {
    if (restaurantNameTextController.text.trim().isBlank != true) return true;
    return false;
  }
}
