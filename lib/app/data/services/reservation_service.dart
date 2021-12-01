import 'package:get/get.dart';
import 'package:sit_eat_web/app/data/model/enum/reservation_status_enum.dart';
import 'package:sit_eat_web/app/data/model/reservation_model.dart';
import 'package:sit_eat_web/app/data/repository/reservation_repository.dart';
import 'package:sit_eat_web/app/data/repository/restaurant_repository.dart';
import 'package:sit_eat_web/app/data/services/auth_service.dart';
import 'package:sit_eat_web/app/data/services/user_service.dart';

class ReservationService extends GetxService {
  final ReservationRepository _reservationRepository = ReservationRepository();
  final RestaurantRepository _restaurantRepository = RestaurantRepository();
  final UserService _userService = UserService();

  Future<List<ReservationModel>?> getAll(String reservationId) async {
    if (reservationId.isNotEmpty) {
      return await _reservationRepository.getAll(reservationId);
    } else {
      return null;
    }
  }

  Future<ReservationModel?> get(String reservationId) async {
    if (reservationId.isNotEmpty) {
      return await _reservationRepository.getReservationById(reservationId);
    } else {
      return null;
    }
  }

  Future<ReservationModel> getReservationById(String? reservationId) async {
    if (reservationId.isBlank == true) {
      return ReservationModel();
    }

    var reservation =
        await _reservationRepository.getReservationById(reservationId!);

    if (reservation.userId.isBlank == true) {
      reservation.userName = "";
      return reservation;
    }

    var user = await _userService.getAppUserName(reservation.userId!);
    reservation.userName = user.name;
    reservation.userPhone = user.phoneNumber;

    return reservation;
  }

  Stream<List<ReservationModel>> listenerReservations() {
    try {
      String restaurantId = AuthService.to.user.value.restaurantId!;
      return _reservationRepository.listenerReservations(restaurantId);
    } catch (e) {
      return Stream.empty();
    }
  }

  Future updateReservationStatus(
    String reservationId,
    ReservationStatus status,
  ) async {
    await _reservationRepository.updateReservationStatus(reservationId, status);
  }

  Future freeTable(String? tableId) async {
    if (tableId == null) return;
    await _restaurantRepository.freeTable(tableId);
    Get.back();
    Get.back();
  }
}
