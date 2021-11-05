import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sit_eat_web/app/controller/tables_controller.dart';
import 'package:sit_eat_web/app/controller/waiting_list_controller.dart';
import 'package:sit_eat_web/app/data/model/table_model.dart';
import 'package:sit_eat_web/pages/tables/widgets/table_card.dart';
import 'package:sit_eat_web/pages/waitinglist/widgets/list_data.dart';
import 'package:sit_eat_web/utils/menu.dart';

class WaitingListPage extends GetView<TablesController> {
  final TablesController _tableController = Get.find<TablesController>();

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
                Wrap(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Posição",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Nome",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Horário da solicitação",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Quantidade de pessoas na mesa",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Telefone",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        // Wrap(
                        //   children: [
                        //     Text("Posição Nome Horário da solicitação"),
                        //   ],
                        // ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Obx(
                    () => Wrap(
                      children: List.generate(
                        _tableController.tables.length,
                        (index) => Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                            height: 45.0,
                            color: index % 2 == 0 ? Color(0xFFe0e0e0) : Color(0xFFbcbcbc),
                            child: ListData(
                              table: _tableController.tables[index],
                            ),
                          ),
                        ),

                        // Padding(
                        //   padding: const EdgeInsets.all(2.0),
                        //   child: Container(
                        //     color: index % 2 == 0 ? Color(0xFFe0e0e0) : Color(0xFFbcbcbc),

                        //   ),
                        // ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
