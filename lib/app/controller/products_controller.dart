import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sit_eat_web/app/data/model/product_model.dart';
import 'package:sit_eat_web/app/data/services/product_service.dart';
import 'package:sit_eat_web/app/data/services/util_service.dart';

class ProductsController extends GetxController {
  final ProductService _productService = ProductService();
  final UtilService _utilService = UtilService();

  final TextEditingController nameTextController = TextEditingController();
  final TextEditingController descriptionTextController =
      TextEditingController();
  final TextEditingController measureTextController = TextEditingController();
  final TextEditingController priceTextController = TextEditingController();
  final TextEditingController linkImageTextController = TextEditingController();

  @override
  void onInit() {
    // getProducts
    super.onInit();
  }

  register() async {
    ProductModel product = ProductModel(
      name: nameTextController.text,
      price: double.tryParse(priceTextController.text.replaceAll(',', '.')),
      description: descriptionTextController.text,
      measure: measureTextController.text,
    );

    String? productId = await _productService.register(product);

    if (productId != null) {
      Get.back();
      _utilService.showSuccessMessage(
          "Sucesso", "Produto cadastrado com sucesso!");
      // getProducts();
    }
  }

  clearFields() {
    nameTextController.clear();
    descriptionTextController.clear();
    measureTextController.clear();
    priceTextController.clear();
    linkImageTextController.clear();
  }
}
