import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sit_eat_web/app/controller/dashboard_controller.dart';
import 'package:sit_eat_web/app/data/model/order_model.dart';
import 'package:sit_eat_web/app/data/model/table_model.dart';

class Order extends StatelessWidget {
  final DashboardController _dashboardController =
      Get.find<DashboardController>();

  // final TableModel order;
  // Order({required this.order});

  // final OrderModel order;

  // const Order(this.order);

  @override
  Widget build(BuildContext context) {
    return Container();
    // Row(
    //   mainAxisAlignment: MainAxisAlignment.spaceAround,
    //   children: [
    //     Text("${order.capacity}"),
    //     Text("${order.number}"),
    //     Text("${order.capacity}"),
    //     Text("${order.busy}"),
    //   ],
    // ListView(
    //   children: [
    //     Row(
    //       mainAxisAlignment: MainAxisAlignment.spaceAround,
    //       children: [
    //         Text("Produto"),
    //         Text("Quantidade"),
    //         Text("Preço"),
    //         Text("Status"),
    //       ],
    //     ),
    //   ListTile(
    // title: Text("Produto ${order.number}"),
    // trailing: Container(
    //   width: 10,
    //   child: Row(
    //     children: [
    //       Text("Qtd ${order.capacity}"),
    //       Text("Preço ${order.reservationid}"),
    //       Text("Status ${order.busy}")
    //     ],
    //   ),
    // ),
    // ),
    // ],
    // );
  }
}
