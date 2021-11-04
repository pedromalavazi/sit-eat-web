import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sit_eat_web/app/data/services/user_service.dart';

class WaitingListController extends GetxController {
  final UserService _userService = UserService();
  final TextEditingController nameTextController = TextEditingController();

  // void getUsers() {
  //   nameTextController:
  //   _userService.get(name);
  // }
}
