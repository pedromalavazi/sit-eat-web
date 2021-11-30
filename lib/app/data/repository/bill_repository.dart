import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sit_eat_web/app/data/model/bill_model.dart';

class BillRepository {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

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

  Stream<List<BillModel>> listenerBills(String restaurantId) {
    try {
      return _firestore
          .collection("bills")
          .where("restaurantId", isEqualTo: restaurantId)
          .snapshots()
          .map((doc) {
        if (doc.docs.length == 0) {
          return <BillModel>[];
        }
        return convertBillsFromDB(doc);
      });
    } catch (e) {
      return Stream.empty();
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

  List<BillModel> convertBillsFromDB(QuerySnapshot billsFromDB) {
    List<BillModel> bills = <BillModel>[];
    billsFromDB.docs.forEach((bill) {
      bills.add(BillModel.fromSnapshot(bill));
    });
    return bills;
  }
}
