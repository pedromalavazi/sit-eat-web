import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sit_eat_web/app/data/model/restaurant_model.dart';
import 'package:sit_eat_web/app/data/services/auth_service.dart';
import 'package:sit_eat_web/app/data/services/restaurant_service.dart';
import 'package:sit_eat_web/app/data/services/user_service.dart';
import 'package:sit_eat_web/app/data/services/util_service.dart';

class RestaurantRegisterController extends GetxController {
  final UtilService _util = UtilService();
  final RestaurantService _restaurantService = RestaurantService();
  final UserService _userService = UserService();
  RxString valueButton = "Editar".obs;
  RxBool editInfo = false.obs;

  // User Controllers
  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();
  final TextEditingController confirmPasswordTextController =
      TextEditingController();

  // Restaurant Controllers
  final TextEditingController addressTextController = TextEditingController();
  final TextEditingController capacityTextController = TextEditingController();
  final TextEditingController openTimeTextController = TextEditingController();
  final TextEditingController closeTimeTextController = TextEditingController();
  final TextEditingController menuTextController = TextEditingController();
  final TextEditingController nameTextController = TextEditingController();
  final TextEditingController stateTextController = TextEditingController();
  final TextEditingController cityTextController = TextEditingController();
  final TextEditingController zipCodeTextController = TextEditingController();
  final TextEditingController numberTextController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  void alterarForm() {
    editInfo = true.obs;
  }

  Future<void> register() async {
    String? restaurantId = await createRestaurant();
    if (restaurantId.isBlank == true) return;

    bool registerSuccess = await createUser(restaurantId!);

    if (registerSuccess) {
      Get.back();
      _util.showSuccessMessage("Sucesso!", "Registro feito com sucesso!");
    } else {
      rollback(restaurantId);
      Get.back();
      _util.showErrorMessage("Falha!", "Falha no cadastro, tente novamente.");
    }
  }

  Future<String?> createRestaurant() async {
    return await _restaurantService.registerNewRestaurant(
      RestaurantModel(
        address: addressTextController.text,
        capacity: int.parse(capacityTextController.text.trim()),
        openTime: convertStringToTimestamp(openTimeTextController.text.trim()),
        closeTime:
            convertStringToTimestamp(closeTimeTextController.text.trim()),
        image: "", // necessário desenvolvimento do serviço
        menu: menuTextController.text.trim(),
        name: nameTextController.text.trim(),
        city: cityTextController.text,
        number: numberTextController.text,
        state: stateTextController.text,
        zipCode: zipCodeTextController.text,
      ),
    );
  }

  Future<bool> createUser(String restaurantId) async {
    return await _userService.createRestaurantUser(
      emailTextController.text.trim(),
      passwordTextController.text.trim(),
      confirmPasswordTextController.text.trim(),
      nameTextController.text.trim(),
      restaurantId,
    );
  }

  Timestamp convertStringToTimestamp(String hour) {
    var date = DateTime.parse("2020-01-15 " + hour + ":00");
    return Timestamp.fromDate(date);
  }

  void rollback(String restaurantId) async {
    await _restaurantService.delete(restaurantId);
    await _userService.delete(AuthService.to.user.value.id);
    await AuthService.to.firebaseUser?.delete();
  }
}
