import 'package:get/get.dart';
import 'package:sit_eat_web/app/controller/restaurant_register_controller.dart';

class RestaurantRegisterBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RestaurantRegisterController>(
        () => RestaurantRegisterController());
  }
}
