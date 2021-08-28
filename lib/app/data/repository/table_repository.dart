import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sit_eat_web/app/data/model/table_model.dart';

class TableRepository {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Retorna restaurante pelo ID
  Future<TableModel> getTable(String tableId, String restaurantId) async {
    try {
      DocumentSnapshot doc = await _firestore
          .collection("restaurants/$restaurantId/tables")
          .doc(tableId)
          .get();
      TableModel restaurant = TableModel.fromSnapshot(doc);
      return restaurant;
    } catch (e) {
      Get.defaultDialog(title: "ERROR", content: Text("Mesa não encontrado."));
      return TableModel();
    }
  }

  Future<List<TableModel>> getTables(String restaurantId) async {
    List<TableModel> tables = <TableModel>[];
    try {
      var tablesDocs =
          await _firestore.collection("restaurants/$restaurantId/tables").get();
      if (tablesDocs.docs.isEmpty) return tables;

      tablesDocs.docs.forEach((tableDoc) {
        tables.add(TableModel.fromSnapshot(tableDoc));
      });

      return tables;
    } catch (e) {
      Get.defaultDialog(
          title: "ERROR", content: Text("Mesas não encontradas."));
      return tables;
    }
  }

  Future<String?> register(TableModel newTable, String restaurantId) async {
    try {
      var reservationId =
          await _firestore.collection("restaurants/$restaurantId/tables").add(
        {
          "number": newTable.number,
          "capacity": newTable.capacity,
          "busy": false,
          "reservationid": "",
        },
      );

      return reservationId.id;
    } catch (e) {
      Get.defaultDialog(
          title: "ERROR", content: Text("Erro ao cadastrar mesa."));
      return null;
    }
  }

  Future<bool> delete(String tableId, String restaurantId) async {
    try {
      await _firestore
          .collection("restaurants/$restaurantId/tables")
          .doc(tableId)
          .delete();
      return true;
    } catch (e) {
      Get.defaultDialog(
          title: "ERROR", content: Text("Não foi possível excluir a mesa."));
      return false;
    }
  }

  List<TableModel> convertTablesFromDB(QuerySnapshot tablesFromDB) {
    List<TableModel> tables = <TableModel>[];
    tablesFromDB.docs.forEach((restaurant) {
      tables.add(TableModel.fromSnapshot(restaurant));
    });
    return tables;
  }
}