import 'package:get/get.dart';
import 'package:sit_eat_web/app/binding/login_binding.dart';
import 'package:sit_eat_web/app/binding/restaurant_register_binding.dart';
import 'package:sit_eat_web/app/binding/restaurant_approval_binding.dart';
import 'package:sit_eat_web/app/binding/restaurant_manage_binding.dart';
import 'package:sit_eat_web/app/binding/restaurant_profile_binding.dart';
import 'package:sit_eat_web/app/binding/tables_binding.dart';
import 'package:sit_eat_web/middleware.dart';
import 'package:sit_eat_web/pages/admin/restaurant_approve_page.dart';
import 'package:sit_eat_web/pages/admin/restaurant_management_page.dart';
import 'package:sit_eat_web/pages/product/products_page.dart';
import 'package:sit_eat_web/pages/home_page.dart';
import 'package:sit_eat_web/pages/login/login_page.dart';
import 'package:sit_eat_web/pages/profile/restaurant_profile_page.dart';
import 'package:sit_eat_web/pages/restaurant/restaurant_register_page.dart';
import 'package:sit_eat_web/pages/tables/tables_page.dart';
part './app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginPage(),
      binding: LoginBinding(),
      middlewares: [GlobalMiddleware()],
    ),
    GetPage(
      name: Routes.HOME,
      page: () => HomePage(),
      middlewares: [GlobalMiddleware()],
    ),
    GetPage(
      name: Routes.RESTAURANT_PROFILE,
      page: () => ProfilePage(),
      binding: RestaurantProfileBinding(),
      middlewares: [GlobalMiddleware()],
    ),
    GetPage(
      name: Routes.RESTAURANTS_MANAGEMENT,
      page: () => RestaurantManagementPage(),
      binding: RestaurantManagementBinding(),
      middlewares: [GlobalMiddleware()],
    ),
    GetPage(
      name: Routes.RESTAURANT_APPROVAL,
      page: () => RestaurantApprovePage(),
      binding: RestaurantApprovalBinding(),
      middlewares: [GlobalMiddleware()],
    ),
    GetPage(
      name: Routes.RESTAURANT_REGISTER,
      page: () => RestaurantRegisterPage(),
      binding: RestaurantRegisterBinding(),
      middlewares: [GlobalMiddleware()],
    ),
    GetPage(
      name: Routes.PRODUCTS,
      page: () => ProductsPage(),
      binding: RestaurantRegisterBinding(),
      middlewares: [GlobalMiddleware()],
    ),
    GetPage(
      name: Routes.TABLES,
      page: () => TablesPage(),
      binding: TablesBinding(),
      middlewares: [GlobalMiddleware()],
    )
  ];
}
