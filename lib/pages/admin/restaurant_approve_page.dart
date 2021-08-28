import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sit_eat_web/app/controller/restaurant_approval_controller.dart';
import 'package:sit_eat_web/utils/menu.dart';
import 'package:sit_eat_web/utils/web_utils.dart';

class RestaurantApprovePage extends GetView<RestaurantApprovalController> {
  final RestaurantApprovalController _approvalController =
      Get.find<RestaurantApprovalController>();

  @override
  Widget build(BuildContext context) {
    return Menu(
      title: "Restaurant Approval",
      body: _body(),
    );
  }

  _body() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Container(
            child: Image.network(_approvalController.restaurant.value.image ??
                ""), //Logo do Restaurante
            padding: EdgeInsets.all(15),
          ),
        ),
        SizedBox(
          width: 28,
        ),
        Expanded(
          flex: 2,
          child: Card(
            child: Obx(
              () => Container(
                padding: EdgeInsets.all(16),
                child: Form(
                  child: ListView(
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),
                      textField('Nome',
                          _approvalController.restaurant.value.name ?? ""),
                      textField(
                        'Endereço',
                        (_approvalController.restaurant.value.address ?? "") +
                            (_approvalController.restaurant.value.number ?? ""),
                      ),
                      textField(
                          'Abertura',
                          _approvalController.getHour(
                              _approvalController.restaurant.value.openTime ??
                                  null)),
                      textField(
                          'Fechamento',
                          _approvalController.getHour(
                              _approvalController.restaurant.value.closeTime ??
                                  null)),
                      textField(
                          'Capacidade Maxima',
                          _approvalController.restaurant.value.capacity == null
                              ? "0"
                              : _approvalController.restaurant.value.capacity
                                  .toString()),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          TextButton(
                            style: TextButton.styleFrom(
                                side: BorderSide(color: Colors.black),
                                backgroundColor: Colors.red,
                                elevation: 15,
                                shadowColor: Colors.red,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 50, vertical: 25),
                                primary: Colors.white,
                                textStyle: TextStyle(fontSize: 15)),
                            onPressed: () {
                              _approvalController.approve();
                            },
                            child: Text("Aprovar"),
                          ),
                          SizedBox(width: 15),
                          TextButton(
                            style: TextButton.styleFrom(
                                side: BorderSide(color: Colors.black),
                                backgroundColor: Colors.white,
                                elevation: 15,
                                shadowColor: Colors.black,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 50, vertical: 25),
                                primary: Colors.black,
                                textStyle: TextStyle(fontSize: 15)),
                            onPressed: () {
                              _approvalController.disapprove();
                            },
                            child: Text("Desativar"),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Padding textField(String info, String label) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2, vertical: 15),
      child: TextField(
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)),
            ),
            enabled: false,
            labelText: info,
            labelStyle: TextStyle(
              fontSize: fontSize(25),
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            hintText: label,
            hintStyle: TextStyle(
              height: 1.5,
              color: Colors.black54,
            ),
            floatingLabelBehavior: FloatingLabelBehavior.always),
      ),
    );
  }
}
