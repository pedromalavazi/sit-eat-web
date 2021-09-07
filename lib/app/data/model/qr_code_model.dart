import 'package:cloud_firestore/cloud_firestore.dart';
import 'enum/qr_code_type_enum.dart';

class QrCodeModel {
  String? id;
  String? qrCode;
  String? referenceId;
  QrCodeType? type;

  QrCodeModel({
    this.id,
    this.qrCode,
    this.referenceId,
    this.type,
  });

  QrCodeModel.fromSnapshot(DocumentSnapshot qrCodeDoc)
      : id = qrCodeDoc.id,
        qrCode = qrCodeDoc["qrCode"],
        referenceId = qrCodeDoc["referenceId"],
        type = QrCodeType.values
            .where((status) => status.toUpper == qrCodeDoc["type"])
            .first;

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "qrCode": qrCode,
      "referenceId": referenceId,
      "type": type,
    };
  }
}
