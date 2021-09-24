import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sit_eat_web/app/data/model/order_card_model.dart';
import 'package:sit_eat_web/app/data/services/order_service.dart';
import 'package:sit_eat_web/app/data/services/product_service.dart';
import 'package:sit_eat_web/app/data/services/util_service.dart';

class OrderController extends GetxController {
  final OrderService _orderService = OrderService();
  final ProductService _prodcutService = ProductService();
  final UtilService _utilService = UtilService();
  String? reservationId;
  RxList<OrderCardModel> orders = <OrderCardModel>[].obs;

  OrderController(String this.reservationId);

  @override
  void onReady() {
    getOrders(reservationId);
    super.onReady();
  }

  changeStatus(String? orderId, bool delivered) async {
    await _orderService.changeDelivered(orderId, delivered);
    await getOrders(reservationId);
  }

  Future getOrders(String? reservationId) async {
    List<OrderCardModel> ordersCard = <OrderCardModel>[];

    var orders = await _orderService.getOrders(reservationId);

    for (var order in orders) {
      var product = await _prodcutService.getById(order.productId);
      ordersCard.add(OrderCardModel(
        id: order.id,
        productId: product.id,
        description: product.description,
        image: product.image,
        measure: product.measure,
        name: product.name,
        orderTime: _utilService.convertTimeStampToString(order.orderTime!),
        price: product.price,
        quantity: order.quantity,
        reservationId: reservationId,
        total: (order.quantity! * product.price!),
        userId: order.userId,
        delivered: order.delivered,
      ));
    }

    this.orders.value = ordersCard;
  }

  getStatusIcon(OrderCardModel order) {
    if (order.delivered != null && order.delivered!)
      return Icon(Icons.check_box_outlined, color: Colors.green);
    else
      return Icon(Icons.check_box_outline_blank);
  }
}
