import 'package:get/get.dart';
import 'package:sit_eat_web/app/controller/register_restaurant_controller.dart';

class RegisterRestaurantBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterRestaurantController>(
        () => RegisterRestaurantController());
  }
}
