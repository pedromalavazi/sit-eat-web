import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:sit_eat_web/binding.dart';
import 'package:sit_eat_web/app/routes/app_pages.dart';

Future<void> main() async {
  await initConfigurations();
  runApp(App());
}

initConfigurations() {}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Sit & Eat',
      getPages: AppPages.routes,
      initialBinding: Binding(),
      initialRoute: Routes.LOGIN,
      // initialRoute: Routes.REGISTER_RESTAURANT,
      debugShowCheckedModeBanner: false,
      theme: _theme(),
    );
  }
}

ThemeData _theme() {
  return ThemeData(
      primarySwatch: Colors.red,
      scaffoldBackgroundColor: Colors.white,
      textTheme: TextTheme(bodyText2: TextStyle(fontSize: 22)));
}
