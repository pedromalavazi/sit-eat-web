import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sit_eat_web/app/controller/dashboard_controller.dart';
import 'package:sit_eat_web/app/data/model/table_model.dart';

class TableOrderCard extends StatelessWidget {
  final DashboardController _dashboardController =
      Get.find<DashboardController>();

  final TableModel table;
  TableOrderCard({required this.table});
  // final double font;
  // TableOrderCard({required this.table, required this.font});

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
                    child: ListView(
                      children: [
                        PaginatedDataTable(
                          columns: [
                            DataColumn(label: Text('Produto')),
                            DataColumn(label: Text('Quantidade')),
                            DataColumn(label: Text('Preço')),
                            DataColumn(label: Text('Status')),
                          ],
                          source: _DataSource(context),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text("Confirmar pedido"),
                        ),
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

class _Row {
  _Row(
    this.valueA,
    this.valueB,
    this.valueC,
    this.valueD,
  );

  final String valueA;
  final String valueB;
  final double valueC;
  final int valueD;

  bool selected = false;
}

class _DataSource extends DataTableSource {
  _DataSource(this.context) {
    _rows = <_Row>[
      _Row('Cell A1', 'CellB1', 5.8, 1),
      _Row('Cell A2', 'CellB2', 3.4, 2),
      _Row('Cell A3', 'CellB3', 5.2, 3),
      _Row('Cell A4', 'CellB4', 2.9, 4),
    ];
  }

  final BuildContext context;
  List<_Row> _rows = [];

  int _selectedCount = 0;

  @override
  DataRow? getRow(int index) {
    assert(index >= 0);
    if (index >= _rows.length) return null;
    final row = _rows[index];
    return DataRow.byIndex(
      index: index,
      selected: row.selected,
      onSelectChanged: (value) {
        if (row.selected != value) {
          _selectedCount += value! ? 1 : -1;
          assert(_selectedCount >= 0);
          row.selected = value;
          notifyListeners();
        }
      },
      cells: [
        DataCell(Text(row.valueA)),
        DataCell(Text(row.valueB)),
        DataCell(Text(row.valueC.toString())),
        DataCell(Text(row.valueD.toString())),
      ],
    );
  }

  @override
  int get rowCount => _rows.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;
}
