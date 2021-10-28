import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sit_eat_web/app/data/model/enum/qr_code_type_enum.dart';
import 'package:sit_eat_web/app/data/model/qr_code_model.dart';

class QrCodeRepository {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Retorna um restaurant pelo QR Code
  Future<QrCodeModel?> getByQrCode(String qrCode) async {
    try {
      QrCodeModel? qrCodeModel = QrCodeModel();
      await _firestore
          .collection('qrCodes')
          .where('qrCode', isEqualTo: qrCode)
          .get()
          .then((QuerySnapshot doc) => {
                if (doc.docs.length > 0)
                  {
                    qrCodeModel = QrCodeModel.fromSnapshot(doc.docs.first),
                  }
                else
                  {
                    qrCodeModel = null,
                  }
              });

      return qrCodeModel;
    } catch (e) {
      Get.defaultDialog(
          title: "ERROR", content: Text("QrCode não encontrado."));
      return null;
    }
  }

  Future<bool> generateQRCode(QrCodeModel qrCodeModel) async {
    try {
      await _firestore.collection('qrCodes').add({
        "qrCode": qrCodeModel.qrCode,
        "referenceId": qrCodeModel.referenceId,
        "type": QrCodeType.values
            .where((type) => type == qrCodeModel.type)
            .first
            .description,
      });
      return true;
    } catch (e) {
      Get.defaultDialog(
          title: "Erro",
          content: Text("Não foi possível cadastrar o QR Code."));
      return false;
    }
  }

  Future<bool> delete(String qrCodeId) async {
    try {
      await _firestore.collection("qrCodes").doc(qrCodeId).delete();
      return true;
    } catch (e) {
      Get.defaultDialog(
          title: "ERROR", content: Text("Não foi possível excluir o QR Code."));
      return false;
    }
  }
}
