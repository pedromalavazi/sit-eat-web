import 'package:get/get.dart';
import 'package:sit_eat_web/app/data/model/order_model.dart';
import 'package:sit_eat_web/app/data/repository/order_repository.dart';
import 'package:sit_eat_web/app/data/services/auth_service.dart';
import 'package:sit_eat_web/app/data/services/reservation_service.dart';
import 'package:sit_eat_web/app/data/services/util_service.dart';

class OrderService extends GetxService {
  OrderRepository _orderRepository = OrderRepository();
  ReservationService _reservationService = ReservationService();
  UtilService _utilService = UtilService();

  Future<OrderModel> getById(String orderId) async {
    if (orderId.isEmpty) {
      _utilService.showInformationMessage(
          "Dados inválidos", "Pedido não encontrado.");
      return OrderModel();
    }

    return await _orderRepository.getById(orderId);
  }

  Future<List<OrderModel>> getOrders(String? reservationId) async {
    if (!isValidId(reservationId)) return <OrderModel>[];

    return await _orderRepository.getOrders(reservationId!);
  }

  Future<bool> changeDelivered(String? orderId, bool delivered) async {
    try {
      return await _orderRepository.changeDelivered(orderId!, delivered);
    } catch (e) {
      return false;
    }
  }

  Stream<List<OrderModel>> listenerBills(List<String> reservations) {
    try {
      return _orderRepository.listenerOrders(reservations);
    } catch (e) {
      return Stream.empty();
    }
  }

  Future setViewed(String? reservationId) async {
    try {
      if (!isValidId(reservationId)) return false;
      await _orderRepository.setViewed(reservationId!);
      Get.back();
    } catch (e) {
      return false;
    }
  }

  bool isValidId(String? id) {
    if (id.isBlank == true) {
      _utilService.showInformationMessage("Dados inválidos", "Id inválido.");
      return false;
    }
    return true;
  }
}
