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
          color: Colors.lightBlue[700],
          elevation: 15.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
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
                          _tableController.delete(table.id);
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
