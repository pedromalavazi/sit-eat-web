import 'package:get/get.dart';
import 'package:sit_eat_web/app/controller/restaurant_manage_controller.dart';

class RestaurantManageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RestaurantManagementController>(
        () => RestaurantManagementController());
  }
}
