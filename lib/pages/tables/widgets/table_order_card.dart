import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sit_eat_web/app/controller/dashboard_controller.dart';
import 'package:sit_eat_web/app/data/model/order_model.dart';
import 'package:sit_eat_web/app/data/model/table_model.dart';
import 'package:sit_eat_web/pages/tables/widgets/orders.dart';

class TableOrderCard extends GetView<DashboardController> {
  final DashboardController _dashboardController =
      Get.find<DashboardController>();

  final TableModel table;
  TableOrderCard({required this.table});
  List<OrderModel> orders = [];

  // final double font;
  // TableOrderCard({required this.table, required this.font});

  @override
  Widget build(BuildContext context) {
    // final columns = ["id", "orderTime", "productId", "quantity", "total"];
    // final columns = ["Number", "Capacity", "Busy"];
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
                    child:
                        // DataTable(
                        //   columns: getColumns(columns),
                        //   rows: getRows(teste),
                        // ),

                        // Wrap(
                        //   children: List.generate(
                        //     _dashboardController.tables.length,
                        //     (index) =>
                        //         Order(order: _dashboardController.tables[index]),
                        //   ),
                        // ),
                        ListView(
                      children: [
                        PaginatedDataTable(
                          columns: [
                            DataColumn(label: Text('Produto')),
                            DataColumn(label: Text('Quantidade')),
                            DataColumn(label: Text('Preço')),
                            DataColumn(label: Text('Status')),
                          ],
                          source: _DataSource(context, table),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text("Confirmar pedido"),
                        ),
                      ],
                    ),

                    // Column(
                    //   children: [)
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //   children: [
                    //     Text("Produto"),
                    //     Text("Quantidade"),
                    //     Text("Preço"),
                    //     Text("Status"),
                    //   ],
                    // ),
                    // ],
                    // ),
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

  List<DataColumn> getColumns(List<String> columns) => columns
      .map((String column) => DataColumn(
            label: Text(column),
          ))
      .toList();
  List<DataRow> getRows(List<TableModel> teste) => teste
      .map((TableModel tableModel) => DataRow(cells: [
            DataCell(Text(tableModel.number.toString())),
            DataCell(Text(tableModel.capacity.toString())),
            DataCell(Text(tableModel.busy.toString()))
          ]))
      .toList();
  // List<DataRow> getRows(List<OrderModel> orders) => orders
  //     .map((OrderModel orderTable) => DataRow(cells: [
  //           DataCell(Text(orderTable.id.toString())),
  //           DataCell(Text(orderTable.orderTime.toString())),
  //           DataCell(Text(orderTable.productId.toString())),
  //           DataCell(Text(orderTable.quantity.toString())),
  //           DataCell(Text(orderTable.total.toString())),
  //         ]))
  //     .toList();
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
  final DashboardController _dashboardController =
      Get.find<DashboardController>();
  final TableModel table;

  _DataSource(this.context, this.table) {
    _rows = <_Row>[
      _Row("Produto", 'CellB1', 5.8, 1),
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
