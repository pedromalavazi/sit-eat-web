import 'package:get/get.dart';
import 'package:sit_eat_web/app/binding/login_binding.dart';
import 'package:sit_eat_web/app/binding/register_restaurant_binding.dart';
import 'package:sit_eat_web/app/binding/restaurant_approval_binding.dart';
import 'package:sit_eat_web/app/binding/restaurant_manage_binding.dart';
import 'package:sit_eat_web/pages/admin/restaurant_approve_page.dart';
import 'package:sit_eat_web/pages/admin/restaurant_management_page.dart';
import 'package:sit_eat_web/pages/home_page.dart';
import 'package:sit_eat_web/pages/login/login_page.dart';
import 'package:sit_eat_web/pages/register/restaurant/register_restaurant_page.dart';
part './app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => HomePage(),
    ),
    GetPage(
      name: Routes.RESTAURANTS_MANAGEMENT,
      page: () => RestaurantManagementPage(),
      binding: RestaurantManagementBinding(),
    ),
    GetPage(
      name: Routes.RESTAURANT_APPROVAL,
      page: () => RestaurantApprovePage(),
      binding: RestaurantApprovalBinding(),
    ),
    GetPage(
      name: Routes.RESTAURANT_REGISTER,
      page: () => RestaurantRegisterPage(),
      binding: RestaurantRegisterBinding(),
    ),
  ];
}
