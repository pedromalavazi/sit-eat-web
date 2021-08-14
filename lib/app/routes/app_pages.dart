import 'package:get/get.dart';
import 'package:sit_eat_web/pages/login/login_page.dart';
part './app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginPage(),
    ),
  ];
}
