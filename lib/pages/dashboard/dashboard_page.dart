import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sit_eat_web/app/controller/dashboard_controller.dart';
import 'package:sit_eat_web/utils/menu.dart';

class DashboardPage extends GetView<DashboardController> {
  final DashboardController _dashboardController =
      Get.find<DashboardController>();
  @override
  Widget build(BuildContext context) {
    return Menu(
      title: "Dashboard",
      body: Wrap(
        // spacing: 20,
        children: List.generate(
          10,
          (index) => Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              width: 200,
              height: 200,
              child: InkWell(
                onTap: () {},
                child: Card(
                  elevation: 15.0,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Número da mesa",
                              style: TextStyle(fontSize: 10.0),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Nome do usuário da mesa",
                            style: TextStyle(fontSize: 10.0),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.group),
                          Text(
                            "23",
                            style: TextStyle(fontSize: 20.0),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
