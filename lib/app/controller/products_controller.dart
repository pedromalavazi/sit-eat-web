import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductsController extends GetxController {
  final TextEditingController nameTextController = TextEditingController();
  final TextEditingController descriptionTextController =
      TextEditingController();
  final TextEditingController priceTextController = TextEditingController();
  final TextEditingController linkImageTextController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }
}
