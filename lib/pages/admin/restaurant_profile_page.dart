import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sit_eat_web/app/controller/restaurant_register_controller.dart';

class ProfilePage extends GetView<RestaurantRegisterController> {
  final RestaurantRegisterController _registerRestaurantController =
      Get.put(RestaurantRegisterController());
  final _formKey = GlobalKey<FormState>();
  int count = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }
}
