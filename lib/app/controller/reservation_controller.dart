import 'package:get/get.dart';
import 'package:sit_eat_web/app/data/services/bill_service.dart';
import 'package:sit_eat_web/app/data/services/order_service.dart';
import 'package:sit_eat_web/app/data/services/reservation_service.dart';

class ReservationController extends GetxController {
  final ReservationService _reservationService = ReservationService();
  final OrderService _orderService = OrderService();
  final BillService _billService = BillService();

  @override
  void onInit() {
    super.onInit();
  }

  void closeBill(String? reservationId) {
    _billService.closeBill(reservationId);
  }

  void freeTable(String? tableId) {
    _reservationService.freeTable(tableId);
  }

  void setViewed(String? reservationId) {
    _orderService.setViewed(reservationId);
  }
}
