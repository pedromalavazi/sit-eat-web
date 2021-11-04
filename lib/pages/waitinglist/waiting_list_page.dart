import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sit_eat_web/app/controller/tables_controller.dart';
import 'package:sit_eat_web/app/controller/waiting_list_controller.dart';
import 'package:sit_eat_web/pages/tables/widgets/table_card.dart';
import 'package:sit_eat_web/utils/menu.dart';

class WaitingListPage extends GetView<WaitingListController> {
  final WaitingListController _tableController = Get.find<WaitingListController>();

  @override
  Widget build(BuildContext context) {
    return Menu(
      title: 'Lista de espera',
      body: _body(context),
    );
  }

  _body(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Wrap(
          children: [
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Text("Posição"),
                        ],
                      ),
                      Column(
                        children: [
                          Text("Nome"),
                        ],
                      ),
                      Column(
                        children: [
                          Text("Horário da solicitação"),
                        ],
                      ),
                      // Wrap(
                      //   children: [
                      //     Text("Posição Nome Horário da solicitação"),
                      //   ],
                      // ),
                    ],
                  ),
                ),
                // Obx(
                //   () => Wrap(
                //     children: List.generate(
                //       _tableController.tables.length,
                //       (index) => TableCard(table: _tableController.tables[index]),
                //     ),
                //   ),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
