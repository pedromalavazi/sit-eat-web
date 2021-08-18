import 'package:get/get.dart';
import 'package:sit_eat_web/pages/admin/adminpages/default_page.dart';
import 'package:sit_eat_web/pages/home/home.dart';
import 'package:sit_eat_web/pages/home/home_test.dart';
import 'package:sit_eat_web/pages/login/login_page.dart';
part './app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginPage(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => HomeTestPage(),
    ),
    // GetPage(
    //   name: Routes.REGISTER_RESTAURANT,
    //   page: () => LoginPage(),
    // ),
  ];
}
