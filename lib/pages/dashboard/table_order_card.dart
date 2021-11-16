import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sit_eat_web/app/data/model/table_model.dart';
import 'package:sit_eat_web/pages/dashboard/table_order_item_card.dart';

class TableOrderCard extends StatelessWidget {
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
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 15.0,
          color: table.busy ?? false ? Colors.red : Colors.green,
          child: InkWell(
            borderRadius: BorderRadius.circular(15),
            onTap: () {
              Get.dialog(
                AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  title: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Mesa ${table.number}',
                        style: TextStyle(fontWeight: FontWeight.bold, fontFamily: "Source Code Pro"),
                      ),
                    ),
                  ),
                  content: Container(
                    width: 600,
                    height: 450,
                    child: Column(
                      children: [
                        TableOrderItemCard(
                          reservationId: table.reservationid!,
                        )
                      ],
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
