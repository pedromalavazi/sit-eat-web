import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sit_eat_web/app/data/model/table_model.dart';
import 'package:sit_eat_web/app/data/services/table_service.dart';
import 'package:sit_eat_web/app/data/services/util_service.dart';

class TablesController extends GetxController {
  final TableService _tableService = TableService();
  final UtilService _utilService = UtilService();

  final TextEditingController tableNumberController = TextEditingController();
  final TextEditingController capacityController = TextEditingController();
  RxList<TableModel> tables = <TableModel>[].obs;

  @override
  void onInit() {
    getTables();
    super.onInit();
  }

  void getTables() async {
    var tables = await _tableService.getTables();
    this.tables.value = sortTables(tables);
  }

  void register() async {
    int number = int.parse(tableNumberController.text);
    int capacity = int.parse(capacityController.text);

    TableModel table = TableModel();
    table.number = number;
    table.capacity = capacity;

    String? id = await _tableService.register(table);

    Get.back(result: {capacity, number});

    if (id != null) {
      _utilService.showSuccessMessage("Sucesso", "Mesa cadastrada com sucesso!");
      getTables();
    }
  }

  void delete(String? id) async {
    bool success = await _tableService.delete(id);

    if (success) {
      _utilService.showSuccessMessage("Sucesso", "Mesa excluída com sucesso!");
      getTables();
    }
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
