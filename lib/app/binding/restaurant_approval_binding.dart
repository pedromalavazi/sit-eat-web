import 'package:get/get.dart';
import 'package:sit_eat_web/app/controller/restaurant_approval_controller.dart';

class RestaurantApprovalBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RestaurantApprovalController>(
        () => RestaurantApprovalController());
  }
}
