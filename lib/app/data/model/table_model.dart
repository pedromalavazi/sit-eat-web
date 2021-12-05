import 'package:cloud_firestore/cloud_firestore.dart';

class TableModel {
  String? id;
  bool? busy;
  int? capacity;
  int? number;
  String? reservationId;
  String? qrCode;

  TableModel({
    this.id,
    this.busy,
    this.capacity,
    this.number,
    this.reservationId,
    this.qrCode,
  });

  TableModel.fromSnapshot(DocumentSnapshot table)
      : id = table.id,
        busy = table["busy"],
        capacity = table["capacity"],
        number = table["number"],
        reservationId = table["reservationId"],
        qrCode = table["qrCode"];
}
