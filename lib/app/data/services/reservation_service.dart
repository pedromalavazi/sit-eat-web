import 'package:get/get.dart';
import 'package:sit_eat_web/app/data/model/reservation_model.dart';
import 'package:sit_eat_web/app/data/repository/reservation_repository.dart';
import 'package:sit_eat_web/app/data/services/util_service.dart';

class ReservationService extends GetxService {
  final ReservationRepository _reservationRepository = ReservationRepository();
  final _util = UtilService();

  Future<List<ReservationModel>?> getAll(String restaurantId) async {
    if (restaurantId.isNotEmpty) {
      return await _reservationRepository.getAll(restaurantId);
    } else {
      return null;
    }
  }
}
