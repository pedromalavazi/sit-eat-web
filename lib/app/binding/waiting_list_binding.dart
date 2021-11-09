import 'package:get/get.dart';
import 'package:sit_eat_web/app/controller/dashboard_controller.dart';
import 'package:sit_eat_web/app/controller/tables_controller.dart';
import 'package:sit_eat_web/app/controller/waiting_list_controller.dart';

class WaitingListBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WaitingListController>(() => WaitingListController());
  }
}
