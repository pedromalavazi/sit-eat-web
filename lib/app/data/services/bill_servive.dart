import 'package:get/get.dart';
import 'package:sit_eat_web/app/data/model/bill_model.dart';
import 'package:sit_eat_web/app/data/model/enum/login_status_enum.dart';
import 'package:sit_eat_web/app/data/model/enum/reservation_status_enum.dart';
import 'package:sit_eat_web/app/data/repository/bill_repository.dart';
import 'package:sit_eat_web/app/data/services/reservation_service.dart';
import 'package:sit_eat_web/app/data/services/user_service.dart';
import 'package:sit_eat_web/app/data/services/util_service.dart';

class BillService extends GetxService {
  final BillRepository _billRepository = BillRepository();
  final ReservationService _reservationService = ReservationService();
  final UserService _userService = UserService();
  final UtilService _util = UtilService();

  Future<BillModel?> getBillByReservationId(String reservationId) async {
    return await _billRepository.getByReservationId(reservationId);
  }

  Future<bool> setBillPaid(String? id) async {
    if (id == null) return false;
    return await _billRepository.setBillPaid(id);
  }

  void closeBill(String? reservationId) async {
    if (reservationId == null) return;

    var reservation = await _reservationService.get(reservationId);
    var bill = await getBillByReservationId(reservationId);

    if (bill == null || reservation == null) return;

    bool success = await setBillPaid(bill.id);

    if (!success) {
      _util.showErrorMessage(
          'Erro', 'Não foi possível fechar a conta, tente novamente');
      return;
    }

    _userService.updateUserStatus(reservation.userId!, LoginStatus.OUT);

    _reservationService.updateReservationStatus(
        reservationId, ReservationStatus.FINALIZADO);

    Get.back();
    Get.back();
    _util.showSuccessMessage('Sucesso', 'Conta fechada com sucesso!');
  }
}
