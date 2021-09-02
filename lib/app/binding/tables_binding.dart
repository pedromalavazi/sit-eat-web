import 'package:get/get.dart';
import 'package:sit_eat_web/app/controller/tables_controller.dart';

class TablesBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TablesController>(() => TablesController());
  }
}
