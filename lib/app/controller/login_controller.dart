import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sit_eat_web/app/data/services/auth_service.dart';
import 'package:sit_eat_web/app/routes/app_pages.dart';

class LoginController extends GetxController {
  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();
  RxBool stayLogged = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  void loginMocked() {
    if (emailTextController.text.trim() == "admin" &&
        passwordTextController.text.trim() == "123") {
      Get.toNamed(Routes.RESTAURANT_PROFILE);
    }
  }

  void login() async {
    bool logged = await AuthService.to.login(
      emailTextController.text.trim(),
      passwordTextController.text.trim(),
    );
    if (logged) {
      Get.offAllNamed(Routes.HOME);
    }
  }

  void resetPassword() async {
    bool userExist = await AuthService.to.resetPassword(
      emailTextController.text.trim(),
    );
    if (!userExist) {
      emailTextController.text = "";
    }
  }
}
