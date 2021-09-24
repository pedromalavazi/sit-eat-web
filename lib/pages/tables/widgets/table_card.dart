import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sit_eat_web/app/controller/tables_controller.dart';
import 'package:sit_eat_web/app/data/model/table_model.dart';

class TableCard extends StatelessWidget {
  final TablesController _tableController = Get.find<TablesController>();

  final TableModel table;
  TableCard({required this.table});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 390,
      height: 170,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Card(
          elevation: 15.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      child: Text(
                        "Mesa ${table.number}",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(width: 200.0),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                      child: InkWell(
                        onTap: () {
                          Get.dialog(
                            AlertDialog(
                              content: Form(
                                child: Container(
                                  width: 280,
                                  height: 80,
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Deseja realmente excluir esta mesa?",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 25.0,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          Container(
                                            width: 100,
                                            height: 35,
                                            child: ElevatedButton(
                                              onPressed: () {
                                                _tableController.delete(table.id);
                                              },
                                              child: Text(
                                                "Excluir",
                                                style: TextStyle(fontSize: 18.0),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: 100,
                                            height: 35,
                                            child: TextButton(
                                              onPressed: () => Get.back(),
                                              child: Text(
                                                "Cancelar",
                                                style: TextStyle(fontSize: 18.0),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        child: Icon(Icons.delete),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      child: Text("Quantidade: ${table.capacity} pessoas"),
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
