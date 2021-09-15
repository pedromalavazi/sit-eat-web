import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sit_eat_web/app/controller/home_controller.dart';
import 'package:sit_eat_web/utils/menu.dart';

class HomePage extends StatelessWidget {
  final HomeController _homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Menu(
      title: "Home",
      body: Center(
        child: Obx(
          () => Container(
            child: _homeController.image.value != ""
                ? Image.network(_homeController.image.value)
                : Container(),
          ),
        ),
      ),
    );
  }
}
