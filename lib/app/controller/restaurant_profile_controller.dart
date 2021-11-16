import 'dart:async';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:sit_eat_web/app/data/model/restaurant_model.dart';
import 'package:sit_eat_web/app/data/services/auth_service.dart';
import 'package:sit_eat_web/app/data/services/image_service.dart';
import 'package:sit_eat_web/app/data/services/restaurant_service.dart';
import 'package:sit_eat_web/app/data/services/user_service.dart';
import 'package:sit_eat_web/app/data/services/util_service.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class RestaurantProfileController extends GetxController {
  final RestaurantService _restaurantService = RestaurantService();
  final ImageService _imageService = ImageService();
  final UserService _userService = UserService();
  final UtilService _util = UtilService();

  final RoundedLoadingButtonController saveButtonController = RoundedLoadingButtonController();
  final RoundedLoadingButtonController editButtonController = RoundedLoadingButtonController();

  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();
  final TextEditingController confirmPasswordTextController = TextEditingController();
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
  final TextEditingController qrCodeTextController = TextEditingController();

  RestaurantModel restaurant = RestaurantModel();
  RxBool editInfo = false.obs;
  late Rx<File> image;

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

    success = await _imageService.uploadRestaurantImage(image.value);

    if (!success) return false;

    return success;
  }

  Future<bool> updateUser() async {
    if (passwordTextController.text.isBlank != true || confirmPasswordTextController.text.isBlank != true) {
      return await _userService.updateUserPassword(passwordTextController.text, confirmPasswordTextController.text);
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
      imageTextController.text = imageFile.name;
      image = imageFile.obs;
    }
  }

  RestaurantModel getFields() {
    return RestaurantModel(
      id: restaurant.id,
      address: addressTextController.text,
      capacity: int.parse(capacityTextController.text.trim()),
      openTime: _util.convertStringToTimestamp(openTimeTextController.text.trim()),
      closeTime: _util.convertStringToTimestamp(closeTimeTextController.text.trim()),
      image: imageTextController.text,
      menu: menuTextController.text.trim(),
      name: nameTextController.text.trim(),
      city: cityTextController.text,
      number: numberTextController.text,
      state: stateTextController.text,
      zipCode: zipCodeTextController.text,
    );
  }

  void loadFields() {
    emailTextController.text = AuthService.to.user.value.email ?? "";
    nameTextController.text = restaurant.name ?? "";
    capacityTextController.text = restaurant.capacity.toString();
    openTimeTextController.text = restaurant.openTime != null ? _util.convertTimeStampToString(restaurant.openTime!) : "";
    closeTimeTextController.text = restaurant.closeTime != null ? _util.convertTimeStampToString(restaurant.closeTime!) : "";
    menuTextController.text = restaurant.menu ?? "";
    addressTextController.text = restaurant.address ?? "";
    numberTextController.text = restaurant.number.toString();
    zipCodeTextController.text = restaurant.zipCode ?? "";
    stateTextController.text = restaurant.state ?? "";
    cityTextController.text = restaurant.city ?? "";
    imageTextController.text = restaurant.image ?? "";
    qrCodeTextController.text = restaurant.qrCode ?? "";
  }

  printingQrCode() async {
    final pw.Document doc = pw.Document();

    doc.addPage(
      pw.Page(
        pageTheme: pw.PageTheme(margin: pw.EdgeInsets.all(50.0)),
        build: (context) => _buildContent(context),
      ),
    );

    await Printing.layoutPdf(onLayout: (PdfPageFormat format) async => doc.save());

    print("C: " + "${restaurant.qrCode}");
  }

  pw.Widget _buildContent(pw.Context context) {
    return pw.Center(
      child: pw.Column(
        children: [
          pw.Padding(
            padding: pw.EdgeInsets.all(80.0),
            child: pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.center,
              children: [
                pw.Container(
                  child: pw.Text(
                    "${restaurant.name}",
                    style: pw.TextStyle(fontSize: 25.0),
                  ),
                ),
              ],
            ),
          ),
          pw.SizedBox(height: 50.0),
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.center,
            children: [
              BarcodeWidget(
                barcode: Barcode.qrCode(),
                data: "${restaurant.qrCode}",
                height: 200.0,
                width: 200.0,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
