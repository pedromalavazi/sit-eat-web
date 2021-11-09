import 'package:get/get.dart';
import 'package:sit_eat_web/app/controller/waiting_list_controller.dart';

class WaitingListBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WaitingListController>(() => WaitingListController());
  }
}
