import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sit_eat_web/app/routes/app_pages.dart';
import 'package:sit_eat_web/app/data/model/restaurant_model.dart';
import 'package:sit_eat_web/app/data/services/restaurant_service.dart';
import 'package:sit_eat_web/app/data/services/user_service.dart';
import 'package:sit_eat_web/app/data/services/util_service.dart';

class RegisterRestaurantController extends GetxController {
  final UtilService _util = UtilService();
  final RestaurantService _restaurantService = RestaurantService();
  final UserService _userService = UserService();

  // User Controllers
  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();
  final TextEditingController confirmPasswordTextController =
      TextEditingController();
  final TextEditingController userNameTextController = TextEditingController();

  // Restaurant Controllers
  final TextEditingController addressTextController = TextEditingController();
  final TextEditingController capacityTextController = TextEditingController();
  final TextEditingController openTimeTextController = TextEditingController();
  final TextEditingController closeTimeTextController = TextEditingController();
  final TextEditingController menuTextController = TextEditingController();
  final TextEditingController nameTextController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> register() async {
    String? restaurantId = await createRestaurant();
    if (restaurantId.isBlank == true) return;

    bool registerSuccess = await createUser(restaurantId!);

    if (registerSuccess) {
      _util.showSuccessMessage("Sucesso!", "Registro feito com sucesso!");
      Get.offAllNamed(Routes.LOGIN);
    }
  }

  Future<String?> createRestaurant() async {
    return await _restaurantService.registerNewRestaurant(
      RestaurantModel(
        address: addressTextController.text,
        capacity: int.parse(capacityTextController.text.trim()),
        openTime: DateTime.parse(openTimeTextController.text.trim()),
        closeTime: DateTime.parse(closeTimeTextController.text.trim()),
        image: "", // necessário desenvolvimento do serviço
        menu: menuTextController.text.trim(),
        name: nameTextController.text.trim(),
      ),
    );
  }

  Future<bool> createUser(String restaurantId) async {
    return await _userService.createRestaurantUser(
      emailTextController.text.trim(),
      passwordTextController.text.trim(),
      confirmPasswordTextController.text.trim(),
      userNameTextController.text.trim(),
      restaurantId,
    );
  }
}