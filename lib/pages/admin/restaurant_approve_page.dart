import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sit_eat_web/app/controller/restaurant_approval_controller.dart';
import 'package:sit_eat_web/utils/menu.dart';

class RestaurantApprovePage extends GetView<RestaurantApprovalController> {
  final RestaurantApprovalController _approvalController = Get.find<RestaurantApprovalController>();

  @override
  Widget build(BuildContext context) {
    return Menu(
      title: "Restaurant Approval",
      body: _body(),
    );
  }

  _body() {
    return Container(
      child: Center(
        child: SingleChildScrollView(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Wrap(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Obx(
                        () => Container(
                          width: 700,
                          height: 470,
                          child: Card(
                            elevation: 15.0,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(25.0),
                                  child: Container(
                                    width: 150,
                                    height: 150,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: NetworkImage(_approvalController.restaurant.value.image ?? ""),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10.0),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 300.0,
                                          height: 42.0,
                                          child: TextFormField(
                                            controller: _approvalController.nameTextController,
                                            enabled: false,
                                            decoration: InputDecoration(
                                              isDense: true,
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Colors.black,
                                                ),
                                              ),
                                              prefixIcon: Icon(Icons.storefront),
                                              labelText: "Nome do restaurante",
                                              hintText: _approvalController.restaurant.value.name ?? "",
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 35.0),
                                        Container(
                                          width: 300.0,
                                          height: 42.0,
                                          child: TextField(
                                            controller: _approvalController.addressTextController,
                                            enabled: false,
                                            decoration: InputDecoration(
                                              isDense: true,
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Colors.black,
                                                ),
                                              ),
                                              prefixIcon: Icon(Icons.home),
                                              labelText: "Endereço",
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 35.0),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 190.0,
                                          height: 42.0,
                                          child: TextField(
                                            controller: _approvalController.openTimeTextController,
                                            enabled: false,
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                              isDense: true,
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Colors.black,
                                                ),
                                              ),
                                              prefixIcon: Icon(Icons.schedule),
                                              labelText: "Abertura",
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 35.0),
                                        Container(
                                          width: 190.0,
                                          height: 42.0,
                                          child: TextField(
                                            controller: _approvalController.closeTimeTextController,
                                            enabled: false,
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                              isDense: true,
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Colors.black,
                                                ),
                                              ),
                                              prefixIcon: Icon(Icons.schedule),
                                              labelText: "Fechamento",
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 35.0),
                                        Container(
                                          width: 185.0,
                                          height: 42.0,
                                          child: TextField(
                                            controller: _approvalController.capacityTextController,
                                            enabled: false,
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                              isDense: true,
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Colors.black,
                                                ),
                                              ),
                                              prefixIcon: Icon(Icons.groups),
                                              labelText: "Capacidade máxima",
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 50.0),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        SizedBox(width: 30.0),
                                        Container(
                                          width: 150.0,
                                          height: 40.0,
                                          child: ElevatedButton(
                                            onPressed: _approvalController.restaurant.value.active == true
                                                ? null
                                                : () {
                                                    Get.dialog(
                                                      AlertDialog(
                                                        content: Form(
                                                          child: Container(
                                                            width: 380,
                                                            height: 80,
                                                            child: Column(
                                                              children: [
                                                                Row(
                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                  children: [
                                                                    Text(
                                                                      "Tem certeza que deseja aprovar este restaurante?",
                                                                      style: TextStyle(
                                                                        fontWeight: FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                SizedBox(
                                                                  height: 25.0,
                                                                ),
                                                                Row(
                                                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                  children: [
                                                                    Container(
                                                                      width: 100,
                                                                      height: 35,
                                                                      child: ElevatedButton(
                                                                        onPressed: () {
                                                                          _approvalController.approve();
                                                                        },
                                                                        child: Text(
                                                                          "Aprovar",
                                                                          style: TextStyle(fontSize: 16.0),
                                                                        ),
                                                                        style: ButtonStyle(
                                                                          backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.green),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      width: 100,
                                                                      height: 35,
                                                                      child: TextButton(
                                                                        onPressed: () => Get.back(),
                                                                        child: Text(
                                                                          "Cancelar",
                                                                          style: TextStyle(fontSize: 18.0),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                            child: Text(
                                              "Aprovar",
                                              style: TextStyle(fontSize: 20.0),
                                            ),
                                            style: ButtonStyle(
                                              backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.green),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 35.0),
                                        Container(
                                          width: 150.0,
                                          height: 40.0,
                                          child: ElevatedButton(
                                            onPressed: _approvalController.restaurant.value.active == false
                                                ? null
                                                : () {
                                                    Get.dialog(
                                                      AlertDialog(
                                                        content: Form(
                                                          child: Container(
                                                            width: 380,
                                                            height: 80,
                                                            child: Column(
                                                              children: [
                                                                Row(
                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                  children: [
                                                                    Text(
                                                                      "Tem certeza que deseja desativar este restaurante?",
                                                                      style: TextStyle(
                                                                        fontWeight: FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                SizedBox(
                                                                  height: 25.0,
                                                                ),
                                                                Row(
                                                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                  children: [
                                                                    Container(
                                                                      width: 100,
                                                                      height: 35,
                                                                      child: ElevatedButton(
                                                                        onPressed: _approvalController.restaurant.value.active == true ? null : () => _approvalController.disapprove(),
                                                                        // () {
                                                                        //   _approvalController.disapprove();
                                                                        // },
                                                                        child: Text(
                                                                          "Desativar",
                                                                          style: TextStyle(fontSize: 16.0),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      width: 100,
                                                                      height: 35,
                                                                      child: TextButton(
                                                                        onPressed: () => Get.back(),
                                                                        child: Text(
                                                                          "Cancelar",
                                                                          style: TextStyle(fontSize: 18.0),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                            child: Text(
                                              "Desativar",
                                              style: TextStyle(fontSize: 20.0),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
