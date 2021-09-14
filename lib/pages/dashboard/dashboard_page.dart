import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sit_eat_web/app/controller/dashboard_controller.dart';
import 'package:sit_eat_web/pages/tables/widgets/table_order_card.dart';
import 'package:sit_eat_web/utils/menu.dart';
import 'package:sit_eat_web/utils/web_utils.dart';

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
        //     GridView.builder(
        //   itemCount: _dashboardController.tables.length, //Quantidade de Mesas

        //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //     childAspectRatio: 2.0,
        //     crossAxisCount: 4,
        //     crossAxisSpacing: 15,
        //   ),

        //   itemBuilder: (BuildContext context, int index) {
        //     return LayoutBuilder(
        //       builder: (context, constraints) {
        //         double font =
        //             fontSize(constraints.maxHeight * 0.15, min: 9, max: 22);
        //         // Card Mesas
        //         return TableOrderCard(
        //           table: _dashboardController.tables[index],
        //           font: font,
        //         );
        //       },
        //     );
        //   },
        // ),
      ),
    );
  }
}
