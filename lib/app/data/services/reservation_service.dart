import 'package:get/get.dart';
import 'package:sit_eat_web/app/data/model/reservation_model.dart';
import 'package:sit_eat_web/app/data/repository/reservation_repository.dart';
import 'package:sit_eat_web/app/data/services/user_service.dart';

class ReservationService extends GetxService {
  final ReservationRepository _reservationRepository = ReservationRepository();
  final UserService _userService = UserService();

  Future<List<ReservationModel>?> getAll(String restaurantId) async {
    if (restaurantId.isNotEmpty) {
      return await _reservationRepository.getAll(restaurantId);
    } else {
      return null;
    }
  }

  Future<ReservationModel> getReservationById(String? restaurantId) async {
    if (restaurantId.isBlank == true) {
      return ReservationModel();
    }

    var reservation =
        await _reservationRepository.getReservationById(restaurantId!);

    if (reservation.userId.isBlank == true) {
      reservation.userName = "";
      return reservation;
    }

    var user = await _userService.getAppUserName(reservation.userId!);
    reservation.userName = user.name;
    reservation.userPhone = user.phoneNumber;

    return reservation;
  }
}
