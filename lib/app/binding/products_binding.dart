import 'package:get/get.dart';
import 'package:sit_eat_web/app/controller/products_controller.dart';

class ProductsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductsController>(() => ProductsController());
  }
}
