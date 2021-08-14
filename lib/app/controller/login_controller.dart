import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sit_eat_web/app/data/services/auth_service.dart';
import 'package:sit_eat_web/app/data/services/util_service.dart';

class LoginController extends GetxController {
  final UtilService _util = UtilService();

  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();
  final TextEditingController confirmPasswordTextController =
      TextEditingController();
  final TextEditingController nameTextController = TextEditingController();
  final TextEditingController phoneNumberTextController =
      TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  void registerUser() async {
    await AuthService.to.createUser(
      emailTextController.text.trim(),
      passwordTextController.text.trim(),
      nameTextController.text,
      phoneNumberTextController.text,
    );
    //Get.toNamed(Routes.LOGIN);
  }

  void login() async {
    //_util.showLoader();
    bool logged = await AuthService.to.login(
      emailTextController.text.trim(),
      passwordTextController.text.trim(),
    );
    if (logged) {
      _util.showSuccessMessage("Sucesso", "Usuário logado com sucesso!");
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
