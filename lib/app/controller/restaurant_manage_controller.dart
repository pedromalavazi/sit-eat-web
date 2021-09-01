import 'package:easy_debounce/easy_debounce.dart';
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
    setFilters();
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
      restaurants = listRest
          .where((element) => element.active != activeFilter.value)
          .toList();

    if (filterNameRestaurantIsFilled()) {
      String restaurantFilterName =
          restaurantNameTextController.text.trim().toLowerCase();
      restaurants = listRest
          .where(
            (rest) => rest.name!.toLowerCase().contains(restaurantFilterName),
          )
          .toList();
    }

    if (!filterActiveIsFilled() && !filterNameRestaurantIsFilled())
      restaurants = listRest.toList();

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

  void setFilters() {
    restaurantNameTextController.addListener(() {
      EasyDebounce.debounce('time-debounce', Duration(milliseconds: 1000),
          () => getRestaurants());
    });
  }

  doFilterRestaurants(List<RestaurantModel> rest) {
    final List<RestaurantModel> teste = rest;
    listRestaurants.value = teste
        .where(
          (rest) => rest.name!
              .toLowerCase()
              .contains(restaurantNameTextController.text.trim().toLowerCase()),
        )
        .toList();
  }
}
