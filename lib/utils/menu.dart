import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:sit_eat_web/app/data/model/enum/login_type_enum.dart';
import 'package:sit_eat_web/app/data/services/auth_service.dart';
import 'package:sit_eat_web/app/routes/app_pages.dart';

class Menu extends StatelessWidget {
  late final Widget body;
  late final String title;

  Menu({
    required this.body,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              AuthService.to.logout();
              Get.offAllNamed(Routes.LOGIN);
            },
          ),
        ],
      ),
      drawer: AuthService.to.user.value.type == LoginType.ADMIN
          ? _menuAdmin()
          : _menuRestaurant(),
      body: body,
    );
  }

  _menuAdmin() {
    return Container(
      width: 250,
      child: Drawer(
        elevation: 10,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.red,
              ),
              child: Center(
                child: SizedBox(
                  width: 220,
                  height: 200,
                  child: Image.asset("assets/logo.png"),
                ),
              ),
            ),
            ListTile(
              title: Row(
                children: [
                  Icon(Icons.home_sharp),
                  Container(
                    width: 10,
                  ),
                  Text(
                    "Home",
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
              onTap: () {
                Get.offAllNamed(Routes.HOME);
              },
            ),
            ListTile(
              title: Row(
                children: [
                  Icon(Icons.assignment_turned_in_outlined),
                  Container(
                    width: 10,
                  ),
                  Text(
                    "Aprovações",
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
              onTap: () {
                Get.offAllNamed(Routes.RESTAURANTS_MANAGEMENT);
              },
            ),
            ListTile(
              title: Row(
                children: [
                  Icon(Icons.developer_board),
                  Container(
                    width: 10,
                  ),
                  Text(
                    "Logs",
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
              onTap: () {
                Get.offAllNamed(Routes.LOGS);
              },
            ),
          ],
        ),
      ),
    );
  }

  _menuRestaurant() {
    return Container(
      width: 250,
      child: Drawer(
        elevation: 10,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.red,
              ),
              child: Center(
                child: SizedBox(
                  width: 220,
                  height: 200,
                  child: Image.asset("assets/logo.png"),
                ),
              ),
            ),
            ListTile(
              title: Row(
                children: [
                  Icon(Icons.home_sharp),
                  Container(
                    width: 10,
                  ),
                  Text(
                    "Home",
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
              onTap: () {
                Get.offAllNamed(Routes.HOME);
              },
            ),
            ListTile(
              title: Row(
                children: [
                  Icon(Icons.restaurant),
                  Container(
                    width: 10,
                  ),
                  Text(
                    "Produtos",
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
              onTap: () {
                Get.offAllNamed(Routes.PRODUCTS);
              },
            ),
            ListTile(
              title: Row(
                children: [
                  Icon(Icons.chair_alt),
                  Container(
                    width: 10,
                  ),
                  Text(
                    "Mesas",
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
              onTap: () {
                Get.offAllNamed(Routes.TABLES);
              },
            ),
            ListTile(
              title: Row(
                children: [
                  Icon(Icons.person),
                  Container(
                    width: 10,
                  ),
                  Text(
                    "Perfil",
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
              onTap: () {
                Get.offAllNamed(Routes.RESTAURANT_PROFILE);
              },
            ),
            ListTile(
              title: Row(
                children: [
                  Icon(Icons.dashboard),
                  Container(
                    width: 10,
                  ),
                  Text(
                    "Dashboard",
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
              onTap: () {
                Get.offAllNamed(Routes.DASHBOARD);
              },
            ),
          ],
        ),
      ),
    );
  }
}
