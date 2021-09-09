import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:sit_eat_web/app/data/services/auth_service.dart';
import 'package:sit_eat_web/app/routes/app_pages.dart';

class LoginController extends GetxController {
  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();
  final RoundedLoadingButtonController loginButtonController =
      RoundedLoadingButtonController();
  RxBool stayLogged = false.obs;

  @override
  void onInit() async {
    bool isLogged = await AuthService.to.getUser();
    if (isLogged) Get.offAllNamed(Routes.HOME);
    super.onInit();
  }

  void login() async {
    loginButtonController.start();
    bool logged = await AuthService.to.login(
      emailTextController.text.trim(),
      passwordTextController.text.trim(),
    );
    loginButtonController.stop();
    doLogin(logged);
  }

  void resetPassword() async {
    bool userExist = await AuthService.to.resetPassword(
      emailTextController.text.trim(),
    );
    if (!userExist) {
      emailTextController.text = "";
    }
  }

  void doLogin(bool success) {
    if (success) {
      loginButtonController.success();
      Timer(Duration(seconds: 1), () {
        Get.offAllNamed(Routes.HOME);
      });
    } else {
      loginButtonController.error();
      Timer(Duration(seconds: 1), () {
        loginButtonController.reset();
      });
    }
  }
}
