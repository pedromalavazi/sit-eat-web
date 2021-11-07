import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sit_eat_web/app/data/model/enum/reservation_status_enum.dart';
import 'package:sit_eat_web/app/data/model/reservation_model.dart';
import 'package:sit_eat_web/app/data/services/util_service.dart';

class ReservationRepository {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final UtilService _util = UtilService();

  // Retorna lista de reservas
  Future<List<ReservationModel>> getAll(String restaurantId) async {
    try {
      var reservation = <ReservationModel>[];
      await _firestore
          .collection('reservations')
          .where('restaurantId', isEqualTo: restaurantId)
          .where('status', whereIn: [
            ReservationStatus.ATIVO.toUpper,
            ReservationStatus.AGUARDANDO.toUpper,
            ReservationStatus.RESERVADO.toUpper
          ])
          .get()
          .then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach((restaurant) {
          reservation.add(ReservationModel.fromSnapshot(restaurant));
        });
      });
      return reservation;
    } catch (e) {
      print(e);
      Get.back();
      _util.showErrorMessage("Erro", "Não foi possível recuperar as reservas.");
      return <ReservationModel>[];
    }
  }
}
