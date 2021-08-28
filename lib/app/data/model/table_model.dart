import 'package:cloud_firestore/cloud_firestore.dart';

class TableModel {
  String? id;
  bool? busy;
  int? capacity;
  int? number;
  String? reservationid;

  TableModel({
    this.id,
    this.busy,
    this.capacity,
    this.number,
    this.reservationid,
  });

  TableModel.fromSnapshot(DocumentSnapshot table)
      : id = table.id,
        busy = table["busy"],
        capacity = table["capacity"],
        number = table["number"],
        reservationid = table["reservationid"];
}
