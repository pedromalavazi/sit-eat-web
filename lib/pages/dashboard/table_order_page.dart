import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sit_eat_web/app/controller/dashboard_controller.dart';
import 'package:sit_eat_web/utils/menu.dart';

class TableOrderPage extends GetView<DashboardController> {
  @override
  Widget build(BuildContext context) {
    return Menu(
      title: "Pedidos da mesa",
      body: Container(
        child: Text("Lista de pedidos"),
      ),
    );
  }
}
