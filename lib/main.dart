import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sit_eat_web/binding.dart';
import 'package:sit_eat_web/app/routes/app_pages.dart';
import 'package:sit_eat_web/pages/home/home.dart';
import 'package:sit_eat_web/utils/app_model.dart';

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
      initialRoute: Routes.HOME,
      debugShowCheckedModeBanner: false,
      theme: _theme(),
    );
  }
}
/*void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AppModel(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: _theme(),
        home: HomePage(),
      ),
    );
  }*/

ThemeData _theme() {
  return ThemeData(
      primarySwatch: Colors.red,
      scaffoldBackgroundColor: Colors.white,
      textTheme: TextTheme(bodyText2: TextStyle(fontSize: 22)));
}
