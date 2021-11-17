import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';
import 'package:sit_eat_web/app/data/model/table_model.dart';
import 'package:sit_eat_web/app/data/services/table_service.dart';
import 'package:sit_eat_web/app/data/services/util_service.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

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

  printingQrCode(TableModel table) async {
    final pw.Document doc = pw.Document();

    doc.addPage(
      pw.Page(
        pageTheme: pw.PageTheme(margin: pw.EdgeInsets.all(50.0)),
        build: (context) => _buildContent(context, table),
      ),
    );

    await Printing.layoutPdf(onLayout: (PdfPageFormat format) async => doc.save());
  }

  pw.Widget _buildContent(pw.Context context, TableModel table) {
    return pw.Center(
      child: pw.Column(
        children: [
          pw.Padding(
            padding: pw.EdgeInsets.all(80.0),
            child: pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.center,
              children: [
                pw.Container(
                  child: pw.Text(
                    "Mesa: " + "${table.number}",
                    style: pw.TextStyle(fontSize: 25.0),
                  ),
                ),
              ],
            ),
          ),
          pw.SizedBox(height: 50.0),
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.center,
            children: [
              BarcodeWidget(
                barcode: Barcode.qrCode(),
                data: "${table.qrCode}",
                height: 200.0,
                width: 200.0,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
