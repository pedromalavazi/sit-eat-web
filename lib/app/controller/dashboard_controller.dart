import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sit_eat_web/app/data/model/order_card_model.dart';
import 'package:sit_eat_web/app/data/model/table_model.dart';
import 'package:sit_eat_web/app/data/services/table_service.dart';

class DashboardController extends GetxController {
  final TableService _tableService = TableService();

  final TextEditingController numberTableTextController =
      TextEditingController();
  final TextEditingController nameTextController = TextEditingController();
  final TextEditingController amountTableTextController =
      TextEditingController();

  RxList<TableModel> tables = <TableModel>[].obs;
  RxList<OrderCardModel> orders = <OrderCardModel>[].obs;

  @override
  void onInit() {
    getTables();
    super.onInit();
  }

  void getTables() async {
    var tables = await _tableService.getTables();
    this.tables.value = sortTables(tables);
  }

  List<TableModel> sortTables(List<TableModel> tables) {
    tables.sort((a, b) {
      if (a.number! > b.number!) return 1;
      if (a.number! < b.number!) return -1;
      return 0;
    });

    return tables;
  }
}
