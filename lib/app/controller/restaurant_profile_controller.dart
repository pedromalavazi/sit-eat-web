import 'dart:async';
import 'dart:html';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:sit_eat_web/app/data/model/restaurant_model.dart';
import 'package:sit_eat_web/app/data/services/auth_service.dart';
import 'package:sit_eat_web/app/data/services/image_service.dart';
import 'package:sit_eat_web/app/data/services/restaurant_service.dart';
import 'package:sit_eat_web/app/data/services/user_service.dart';
import 'package:sit_eat_web/app/data/services/util_service.dart';

class RestaurantProfileController extends GetxController {
  final RestaurantService _restaurantService = RestaurantService();
  final ImageService _imageService = ImageService();
  final UserService _userService = UserService();
  final UtilService _util = UtilService();

  final RoundedLoadingButtonController saveButtonController =
      RoundedLoadingButtonController();
  final RoundedLoadingButtonController editButtonController =
      RoundedLoadingButtonController();

  final TextEditingController emailTetController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();
  final TextEditingController confirmPasswordTextController =
      TextEditingController();
  final TextEditingController nameTextController = TextEditingController();
  final TextEditingController capacityTextController = TextEditingController();
  final TextEditingController openTimeTextController = TextEditingController();
  final TextEditingController closeTimeTextController = TextEditingController();
  final TextEditingController menuTextController = TextEditingController();
  final TextEditingController addressTextController = TextEditingController();
  final TextEditingController numberTextController = TextEditingController();
  final TextEditingController zipCodeTextController = TextEditingController();
  final TextEditingController stateTextController = TextEditingController();
  final TextEditingController cityTextController = TextEditingController();
  final TextEditingController imageTextController = TextEditingController();

  RestaurantModel restaurant = RestaurantModel();
  RxBool editInfo = false.obs;
  Uint8List? uploadedImage;

  @override
  void onInit() {
    getRestaurant();
    super.onInit();
  }

  void editForm() {
    editInfo.value = true;
  }

  void saveForm() async {
    saveButtonController.start();
    var success = await updateProfile();
    saveButtonController.stop();
    if (success) {
      saveButtonController.success();
      Timer(Duration(seconds: 2), () {
        editInfo.value = false;
        saveButtonController.reset();
      });
    } else {
      saveButtonController.error();
      Timer(Duration(seconds: 2), () {
        saveButtonController.reset();
      });
    }
  }

  void getRestaurant() async {
    String? loggedRestaurant = AuthService.to.user.value.restaurantId;
    if (loggedRestaurant != null) {
      restaurant = await _restaurantService.getById(loggedRestaurant);
      loadFields();
    }
  }

  Future<bool> updateProfile() async {
    bool success = await updateUser();

    if (!success) return false;

    success = await updateRestaurant();

    if (!success) return false;

    return success;
  }

  Future<bool> updateUser() async {
    if (passwordTextController.text.isBlank != true ||
        confirmPasswordTextController.text.isBlank != true) {
      return await _userService.updateUserPassword(
          passwordTextController.text, confirmPasswordTextController.text);
    }

    return true;
  }

  Future<bool> updateRestaurant() async {
    var restaurantUpdate = getFields();

    var success = await _restaurantService.update(restaurantUpdate);

    return success;
  }

  /// Get from gallery
  Future pickImage() async {
    var imageFile = await ImagePickerWeb.getImage(outputType: ImageType.file);

    if (imageFile is File) {
      imageTextController.text =
          await _imageService.uploadRestaurantImage(imageFile);
    }
  }

  RestaurantModel getFields() {
    return RestaurantModel(
      id: restaurant.id,
      address: addressTextController.text,
      capacity: int.parse(capacityTextController.text.trim()),
      openTime:
          _util.convertStringToTimestamp(openTimeTextController.text.trim()),
      closeTime:
          _util.convertStringToTimestamp(closeTimeTextController.text.trim()),
      image: imageTextController.text, // necessário desenvolvimento do serviço
      menu: menuTextController.text.trim(),
      name: nameTextController.text.trim(),
      city: cityTextController.text,
      number: numberTextController.text,
      state: stateTextController.text,
      zipCode: zipCodeTextController.text,
    );
  }

  void loadFields() {
    emailTetController.text = AuthService.to.user.value.email ?? "";
    nameTextController.text = restaurant.name ?? "";
    capacityTextController.text = restaurant.capacity.toString();
    openTimeTextController.text = restaurant.openTime != null
        ? _util.convertTimeStampToString(restaurant.openTime!)
        : "";
    closeTimeTextController.text = restaurant.closeTime != null
        ? _util.convertTimeStampToString(restaurant.closeTime!)
        : "";
    menuTextController.text = restaurant.menu ?? "";
    addressTextController.text = restaurant.address ?? "";
    numberTextController.text = restaurant.number.toString();
    zipCodeTextController.text = restaurant.zipCode ?? "";
    stateTextController.text = restaurant.state ?? "";
    cityTextController.text = restaurant.city ?? "";
    imageTextController.text = restaurant.image ?? "";
  }
}
