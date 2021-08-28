import 'package:cloud_firestore/cloud_firestore.dart';

class TableModel {
  bool? busy;
  int? capacity;
  int? number;
  String? reservationid;

  TableModel({
    this.busy,
    this.capacity,
    this.number,
    this.reservationid,
  });

  TableModel.fromSnapshot(DocumentSnapshot table)
      : busy = table["busy"],
        capacity = table["capacity"],
        number = table["number"],
        reservationid = table["reservationid"];
}
