import 'package:get/get.dart';
import 'package:sit_eat_web/app/data/model/reservation_model.dart';
import 'package:sit_eat_web/app/data/repository/reservation_repository.dart';
import 'package:sit_eat_web/app/data/services/auth_service.dart';
import 'package:sit_eat_web/app/data/services/util_service.dart';

class ReservationService extends GetxService {
  ReservationRepository _reservationRepository = ReservationRepository();
  UtilService _utilService = UtilService();

  Future<List<ReservationModel>> getReservations() async {
    if (!isValidId(AuthService.to.user.value.restaurantId)) return <ReservationModel>[];
    return await _reservationRepository.getReservations(AuthService.to.user.value.restaurantId!);
  }

  bool isValidId(String? id) {
    if (id.isBlank == true) {
      _utilService.showInformationMessage("Dados inválidos", "Id inválido.");
      return false;
    }
    return true;
  }
}
