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

  Stream<List<ReservationModel>> listenerReservations(String restaurantId) {
    try {
      return _firestore
          .collection('reservations')
          .where('restaurantId', isEqualTo: restaurantId)
          .where('status', whereIn: [
            ReservationStatus.ATIVO.toUpper,
            ReservationStatus.AGUARDANDO.toUpper,
            ReservationStatus.RESERVADO.toUpper,
            ReservationStatus.FINALIZADO.toUpper,
          ])
          .snapshots()
          .map((doc) {
            if (doc.docs.length == 0) {
              return <ReservationModel>[];
            }
            return convertReservationsFromDB(doc);
          });
    } catch (e) {
      return Stream.empty();
    }
  }

  List<ReservationModel> convertReservationsFromDB(
      QuerySnapshot reservationsFromDB) {
    List<ReservationModel> reservations = <ReservationModel>[];
    reservationsFromDB.docs.forEach((reservation) {
      reservations.add(ReservationModel.fromSnapshot(reservation));
    });
    return reservations;
  }

  Future<ReservationModel> getReservationById(String reservationId) async {
    try {
      DocumentSnapshot doc =
          await _firestore.collection("reservations").doc(reservationId).get();
      ReservationModel reservation = ReservationModel.fromSnapshot(doc);
      return reservation;
    } catch (e) {
      return ReservationModel();
    }
  }

  Future updateReservationStatus(
      String reservationId, ReservationStatus status) async {
    try {
      await _firestore.collection('reservations').doc(reservationId).update({
        'status': status.toUpper,
      });
    } catch (e) {
      return;
    }
  }
}
