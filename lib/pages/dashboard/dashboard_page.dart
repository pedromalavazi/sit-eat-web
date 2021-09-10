import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sit_eat_web/app/controller/dashboard_controller.dart';
import 'package:sit_eat_web/pages/tables/widgets/table_order_card.dart';
import 'package:sit_eat_web/utils/menu.dart';
import 'package:sit_eat_web/utils/web_utils.dart';

class DashboardPage extends GetView<DashboardController> {
  final DashboardController _dashboardController =
      Get.find<DashboardController>();

  // int teste = 20, count = 1;
  @override
  Widget build(BuildContext context) {
    return Menu(
        title: "Dashboard",
        body: Obx(
          () => GridView.builder(
            itemCount: _dashboardController.tables.length, //Quantidade de Mesas

            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 2.0,
              crossAxisCount: 4,
              crossAxisSpacing: 15,
            ),

            itemBuilder: (BuildContext context, int index) {
              return LayoutBuilder(
                builder: (context, constraints) {
                  double font =
                      fontSize(constraints.maxHeight * 0.15, min: 9, max: 22);
                  // Card Mesas
                  return TableOrderCard(
                    table: _dashboardController.tables[index],
                    font: font,
                  );
                },
              );
            },
          ),
        )

        //     Wrap(
        //   // spacing: 30,
        //   children: List.generate(
        //     10,
        //     (index) => Padding(
        //       padding: const EdgeInsets.all(20.0),
        //       child: Container(
        //         width: 200,
        //         height: 170,
        //         child: Card(
        //           elevation: 15.0,
        //           color: _dashboardController.occupationTable.value == false
        //               ? Colors.green
        //               : Colors.red,
        //           child: InkWell(
        //             onTap: () {
        //               SimpleDialog(
        //                 title: Text("Pedidos da mesa X:"),
        //                 children: [],
        //               );
        //               // Get.toNamed(Routes.ORDERTABLE);
        //             },
        //             child: Column(
        //               children: [
        //                 Row(
        //                   children: [
        //                     Padding(
        //                       padding: const EdgeInsets.all(16.0),
        //                       child: Text(
        //                         "Número da mesa",
        //                         style: TextStyle(fontSize: 20.0),
        //                       ),
        //                     ),
        //                   ],
        //                 ),
        //                 Row(
        //                   children: [
        //                     Padding(
        //                       padding: const EdgeInsets.all(16.0),
        //                       child: Text(
        //                         "Cliente",
        //                         style: TextStyle(fontSize: 16.0),
        //                       ),
        //                     ),
        //                   ],
        //                 ),
        //                 Row(
        //                   children: [
        //                     Padding(
        //                       padding: const EdgeInsets.all(16.0),
        //                       child: Icon(Icons.group),
        //                     ),
        //                     Text(
        //                       "04",
        //                       style: TextStyle(fontSize: 20.0),
        //                     ),
        //                   ],
        //                 ),
        //               ],
        //             ),
        //           ),
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
        );
  }
}
