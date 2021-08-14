import 'package:get/get.dart';
import 'package:sit_eat_web/app/data/services/auth_service.dart';

class Binding implements Bindings {
  @override
  void dependencies() {
    //Services
    Get.put(AuthService(), permanent: true);
  }
}
