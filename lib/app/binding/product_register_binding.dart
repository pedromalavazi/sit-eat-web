import 'package:get/get.dart';
import 'package:sit_eat_web/app/controller/product_register_controller.dart';

class ProductRegisterBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductRegisterController>(() => ProductRegisterController());
  }
}
