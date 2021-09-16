import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sit_eat_web/app/controller/dashboard_controller.dart';
import 'package:sit_eat_web/pages/tables/widgets/table_order_card.dart';
import 'package:sit_eat_web/utils/menu.dart';

class DashboardPage extends GetView<DashboardController> {
  final DashboardController _dashboardController =
      Get.find<DashboardController>();
  @override
  Widget build(BuildContext context) {
    return Menu(
      title: "Dashboard",
      body: Obx(
        () => Wrap(
          children: List.generate(
            _dashboardController.tables.length,
            (index) =>
                TableOrderCard(table: _dashboardController.tables[index]),
          ),
        ),
      ),
    );
  }
}
