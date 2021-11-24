import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sit_eat_web/app/data/model/bill_model.dart';
import 'package:sit_eat_web/app/data/services/util_service.dart';

class BillRepository {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final UtilService _util = UtilService();

  Future<BillModel?> getByReservationId(String reservationId) async {
    try {
      BillModel? bill = BillModel();
      await _firestore
          .collection("bills")
          .where('reservationId', isEqualTo: reservationId)
          .where('paid', isEqualTo: false)
          .where('asked', isEqualTo: true)
          .get()
          .then(
            (QuerySnapshot doc) => {
              if (doc.docs.length > 0)
                {
                  bill = BillModel.fromSnapshot(doc.docs.first),
                }
              else
                {
                  bill = null,
                }
            },
          );

      return bill;
    } catch (e) {
      return null;
    }
  }

  Future<bool> setBillPaid(String billId) async {
    try {
      await _firestore.collection('bills').doc(billId).update({'paid': true});
      return true;
    } catch (e) {
      return false;
    }
  }
}
