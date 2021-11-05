import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sit_eat_web/app/controller/order_controller.dart';

class TableOrderItemCard extends GetView<OrderController> {
  final String reservationId;
  TableOrderItemCard({required this.reservationId});

  @override
  Widget build(BuildContext context) {
    final OrderController _orderController = Get.put(OrderController(reservationId));
    return Container(
      height: 420,
      child: SingleChildScrollView(
        child: Wrap(
          children: [
            Obx(
              () => Column(
                children: List.generate(
                  _orderController.orders.length,
                  (index) => Container(
                    margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                    width: 600,
                    height: 60,
                    child: Card(
                      elevation: 5.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Obx(
                        () => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              _orderController.orders[index].name ?? "",
                              style: TextStyle(
                                fontSize: 20.0,
                              ),
                            ),
                            Text(
                              _orderController.orders[index].measure ?? "",
                              style: TextStyle(
                                fontSize: 20.0,
                              ),
                            ),
                            Text(
                              _orderController.orders[index].quantity != null ? _orderController.orders[index].quantity!.toString() : "",
                              style: TextStyle(
                                fontSize: 20.0,
                              ),
                            ),
                            IconButton(
                              splashRadius: 20,
                              onPressed: () {
                                _orderController.changeStatus(
                                  _orderController.orders[index].id,
                                  (_orderController.orders[index].delivered != null ? !_orderController.orders[index].delivered! : true),
                                );
                              },
                              icon: _orderController.getStatusIcon(_orderController.orders[index]),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
