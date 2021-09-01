import 'package:get/get.dart';
import 'package:sit_eat_web/app/controller/restaurant_profile_controller.dart';

class RestaurantProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RestaurantProfileController>(
        () => RestaurantProfileController());
  }
}
