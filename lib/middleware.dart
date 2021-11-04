import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sit_eat_web/app/data/model/enum/login_type_enum.dart';
import 'package:sit_eat_web/app/data/services/auth_service.dart';
import 'package:sit_eat_web/app/routes/app_pages.dart';

class GlobalMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    return (AuthService.to.userIsAuthenticated.value || route == Routes.LOGIN || route == Routes.RESTAURANT_REGISTER) ? null : RouteSettings(name: Routes.LOGIN);
  }

  @override
  GetPage? onPageCalled(GetPage? page) {
    if (page == null) return null;
    // if (page.name == Get.currentRoute) return null;

    var isAdminPages = (page.name == Routes.RESTAURANTS_MANAGEMENT || page.name == Routes.RESTAURANT_APPROVAL);

    // if (AuthService.to.user.value.type != LoginType.ADMIN && isAdminPages) return null;

    return page;
  }

  // @override
  // List<Bindings> onBindingsStart(List<Bindings> bindings) {
  //   // This function will be called right before the Bindings are initialize,
  //   // then bindings is null
  //   bindings = [OtherBinding()];
  //   return bindings;
  // }

  // @override
  // GetPageBuilder onPageBuildStart(GetPageBuilder page) {
  //   print('Bindings of ${page.toString()} are ready');
  //   return page;
  // }

  // @override
  // Widget onPageBuilt(Widget page) {
  //   print('Widget ${page.toStringShort()} will be showed');
  //   return page;
  // }

  // @override
  // void onPageDispose() {
  //   print('PageDisposed');
  // }
}
