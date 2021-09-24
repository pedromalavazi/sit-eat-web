// ignore: avoid_web_libraries_in_flutter
import 'dart:html';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:sit_eat_web/app/data/services/auth_service.dart';
import 'package:sit_eat_web/app/data/services/user_service.dart';
import 'package:sit_eat_web/app/data/services/util_service.dart';
import 'package:sit_eat_web/app/data/model/restaurant_model.dart';
import 'package:sit_eat_web/app/data/services/restaurant_service.dart';

class RestaurantRegisterController extends GetxController {
  final UtilService _util = UtilService();
  final RestaurantService _restaurantService = RestaurantService();
  final UserService _userService = UserService();

  RxBool editInfo = true.obs;

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
  final TextEditingController imageTextController = TextEditingController();

  late Rx<File> image;

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
        openTime:
            _util.convertStringToTimestamp(openTimeTextController.text.trim()),
        closeTime:
            _util.convertStringToTimestamp(closeTimeTextController.text.trim()),
        image: image.value.name,
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

  void rollback(String restaurantId) async {
    await _restaurantService.delete(restaurantId);
    await _userService.delete(AuthService.to.user.value.id);
    await AuthService.to.deleteUser(
      emailTextController.text.trim(),
      passwordTextController.text.trim(),
    );
  }

  Future pickImage() async {
    var imageFile = await ImagePickerWeb.getImage(outputType: ImageType.file);

    if (imageFile is File) {
      imageTextController.text = imageFile.name;
      image = imageFile.obs;
    }
  }
}
