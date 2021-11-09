import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sit_eat_web/app/controller/waiting_list_controller.dart';
import 'package:sit_eat_web/utils/menu.dart';

class WaitingListPage extends GetView<WaitingListController> {
  final WaitingListController _waitingListController = Get.find<WaitingListController>();

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
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(35.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Obx(
                    () => DataTable(
                      columns: [
                        DataColumn(
                          label: Text(
                            "Posição",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            "Nome",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            "Horário de reserva",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            "Quantidade de pessoas na mesa",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            "Telefone",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                      ],
                      rows: List.generate(
                        _waitingListController.reservations.length,
                        (index) => DataRow(
                          color: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
                            if (states.contains(MaterialState.selected)) {
                              return Theme.of(context).colorScheme.primary.withOpacity(0.08);
                            }
                            if (index.isEven) {
                              return Colors.grey.withOpacity(0.3);
                            }

                            return null;
                          }),
                          cells: [
                            DataCell(
                              Text("${_waitingListController.reservations.elementAt(index).userId}"),
                            ),
                            DataCell(
                              Text("Coluna 2"),
                            ),
                            DataCell(
                              Text("Coluna 3"),
                            ),
                            DataCell(
                              Text("Coluna 4"),
                            ),
                            DataCell(
                              Text("Coluna 5"),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
