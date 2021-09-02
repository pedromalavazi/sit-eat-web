import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sit_eat_web/app/controller/tables_controller.dart';
import 'package:sit_eat_web/app/data/model/table_model.dart';

class TableCard extends StatelessWidget {
  final TablesController _tableController = Get.find<TablesController>();

  final TableModel table;
  final double font;
  TableCard({required this.table, required this.font});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.black26),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Row(
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 200),
                child: Icon(Icons.arrow_right),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Mesa ${table.number}",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: font,
                      fontFamily: "Soucer Code Pro",
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Quantidade: ${table.capacity} pessoas",
                    style: TextStyle(
                      fontSize: font,
                      color: Colors.black87,
                      fontFamily: "Soucer Code Pro",
                    ),
                  ),
                ],
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              _tableController.delete(table.id);
            },
            child: Icon(Icons.delete),
          )
        ],
      ),
    );
  }
}
