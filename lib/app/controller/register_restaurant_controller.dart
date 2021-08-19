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
  final TextEditingController stateTextController = TextEditingController();
  final TextEditingController cityTextController = TextEditingController();
  final TextEditingController zipCodeTextController = TextEditingController();
  final TextEditingController numberTextController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    gerarHorarios();
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

  final List<String> horary = [];
  final List<String> states = [
    "Acre",
    "Alagoas",
    "Amapá",
    "Amazonas",
    "Bahia",
    "Ceará",
    "Espírito Santo",
    "Goiás",
    "Maranhão",
    "Mato Grosso",
    "Mato Grosso do Sul",
    "Minas Gerais",
    "Pará",
    "Paraíba",
    "Paraná",
    "Pernambuco",
    "Piauí",
    "Rio de Janeiro",
    "Rio Grande do Norte",
    "Rio Grande do Sul",
    "Rondônia",
    "Roraima",
    "Santa Catarina",
    "São Paulo",
    "Sergipe",
    "Tocantins",
    "Distrito Federal"
  ];

  void gerarHorarios() {
    for (int i = 0; i < 24; i++) {
      for (int j = 0; j < 60; j++) {
        if (i < 10 && j < 10) {
          horary.add("0$i:0$j\n");
        } else if (i < 10) {
          horary.add("0$i:$j\n");
        } else if (j < 10) {
          horary.add("$i:0$j\n");
        } else {
          horary.add("$i:$j\n");
        }
      }
    }
  }
}
