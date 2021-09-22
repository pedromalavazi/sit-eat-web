// ignore: avoid_web_libraries_in_flutter
import 'dart:html';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:sit_eat_web/app/data/model/product_model.dart';
import 'package:sit_eat_web/app/data/services/image_service.dart';
import 'package:sit_eat_web/app/data/services/product_service.dart';
import 'package:sit_eat_web/app/data/services/util_service.dart';

class ProductsController extends GetxController {
  final ProductService _productService = ProductService();
  final UtilService _utilService = UtilService();
  ImageService _imageService = ImageService();

  final TextEditingController nameTextController = TextEditingController();
  final TextEditingController descriptionTextController =
      TextEditingController();
  final TextEditingController measureTextController = TextEditingController();
  final TextEditingController priceTextController = TextEditingController();
  final TextEditingController imageTextController = TextEditingController();

  RxList<ProductModel> listProducts = <ProductModel>[].obs;
  late Rx<File> image;

  @override
  void onInit() {
    getProducts();
    super.onInit();
  }

  void getProducts() async {
    listProducts.value = await _productService.getProducts();
  }

  register() async {
    ProductModel product = ProductModel(
      name: nameTextController.text,
      price: double.tryParse(priceTextController.text.replaceAll(',', '.')),
      description: descriptionTextController.text,
      measure: measureTextController.text,
      image: image.value.name,
    );

    String? productId = await _productService.register(product);

    bool success = await _imageService.uploadProductImage(image.value);

    if (productId != null && success) {
      Get.back();
      _utilService.showSuccessMessage(
          "Sucesso", "Produto cadastrado com sucesso!");
      clearFields();
      getProducts();
    }
  }

  /// Get from gallery
  Future pickImage() async {
    var imageFile = await ImagePickerWeb.getImage(outputType: ImageType.file);

    if (imageFile is File) {
      image = imageFile.obs;
      imageTextController.text = imageFile.name;
    }
  }

  void delete(String? id) async {
    bool success = await _productService.delete(id);

    if (success) getProducts();
  }

  clearFields() {
    nameTextController.clear();
    descriptionTextController.clear();
    measureTextController.clear();
    priceTextController.clear();
    imageTextController.clear();
  }
}
