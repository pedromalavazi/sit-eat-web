import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sit_eat_web/app/controller/dashboard_controller.dart';
import 'package:sit_eat_web/app/data/model/table_model.dart';

class TableOrderCard extends GetView<DashboardController> {
  final DashboardController _dashboardController =
      Get.find<DashboardController>();

  final TableModel table;
  TableOrderCard({required this.table});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        width: 170,
        height: 170,
        child: Card(
          elevation: 15.0,
          color: _dashboardController.occupationTable.value
              ? Colors.red
              : Colors.green,
          child: InkWell(
            onTap: () {
              Get.dialog(
                AlertDialog(
                  title: Text("Pedidos da mesa ${table.number}:"),
                  content: Container(
                    width: 500,
                    height: 500,
                    child: SingleChildScrollView(
                      child: Wrap(
                        children: [
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "Produto",
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Quantidade",
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Preço",
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Status",
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            children: List.generate(
                              20,
                              (index) => Container(
                                margin: EdgeInsets.fromLTRB(0, 25, 0, 0),
                                width: 500,
                                height: 60,
                                child: Card(
                                  elevation: 2.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        "Produto",
                                        style: TextStyle(
                                          fontSize: 20.0,
                                        ),
                                      ),
                                      Text(
                                        "Quantidade",
                                        style: TextStyle(
                                          fontSize: 20.0,
                                        ),
                                      ),
                                      Text(
                                        "Preço",
                                        style: TextStyle(
                                          fontSize: 20.0,
                                        ),
                                      ),
                                      Text(
                                        "Status",
                                        style: TextStyle(
                                          fontSize: 20.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        "${table.number}",
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        "Cliente",
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Icon(Icons.group),
                    ),
                    Text(
                      "${table.capacity}",
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
