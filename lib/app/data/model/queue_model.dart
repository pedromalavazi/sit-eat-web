import 'package:cloud_firestore/cloud_firestore.dart';

class QueueModel {
  String? id;
  String? reservationId;

  QueueModel({this.id, this.reservationId});

  QueueModel.fromSnapshot(DocumentSnapshot queue)
      : id = queue.id,
        reservationId = queue["reservationId"];
}
