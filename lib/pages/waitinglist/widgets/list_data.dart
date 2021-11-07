import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sit_eat_web/app/controller/tables_controller.dart';
import 'package:sit_eat_web/app/data/model/table_model.dart';

class ListData extends StatelessWidget {
  final TableModel table;
  ListData({required this.table});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DataTable(
            columns: [
              DataColumn(
                label: Text(""),
              ),
              DataColumn(
                label: Text(""),
              ),
              DataColumn(
                label: Text(""),
              ),
              DataColumn(
                label: Text(""),
              ),
              DataColumn(
                label: Text(""),
              ),
              // DataColumn(
              //   label: Text("Posição"),
              // ),
              // DataColumn(
              //   label: Text("Nome"),
              // ),
              // DataColumn(
              //   label: Text("Horário da reserva"),
              // ),
              // DataColumn(
              //   label: Text("Quantidade de pessoas na mesa"),
              // ),
              // DataColumn(
              //   label: Text("Telefone"),
              // ),
            ],
            rows: [
              DataRow(
                cells: [
                  DataCell(
                    Text("${table.number}"),
                  ),
                  DataCell(
                    Text("Quantidade: ${table.capacity} pessoas"),
                  ),
                  DataCell(
                    Text("Nome ${table.number}"),
                  ),
                  DataCell(
                    Text("Horário: ${table.capacity}"),
                  ),
                  DataCell(
                    Text("Tefone: ${table.capacity}"),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
