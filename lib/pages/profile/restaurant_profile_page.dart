import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sit_eat_web/app/controller/restaurant_profile_controller.dart';
import 'package:sit_eat_web/app/routes/app_pages.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:sit_eat_web/utils/menu.dart';

class ProfilePage extends GetView<RestaurantProfileController> {
  final RestaurantProfileController _restaurantRegisterController =
      Get.find<RestaurantProfileController>();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Menu(
      title: "Perfil",
      body: Obx(
        () => Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 990,
                    height: 370,
                    child: Card(
                      elevation: 15.0,
                      child: ListView(
                        children: [
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(25, 25, 0, 0),
                                width: 300.0,
                                height: 40.0,
                                child: TextFormField(
                                  initialValue: "",
                                  cursorColor: Colors.black,
                                  obscureText: false,
                                  enabled: false,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                      ),
                                    ),
                                    prefixIcon: Icon(Icons.email),
                                    labelText: "E-mail",
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(25, 25, 0, 0),
                                width: 292.5,
                                height: 40.0,
                                child: TextFormField(
                                  initialValue: "",
                                  cursorColor: Colors.black,
                                  obscureText: true,
                                  enabled: _restaurantRegisterController
                                      .editInfo.value,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                      ),
                                    ),
                                    prefixIcon: Icon(Icons.password),
                                    labelText: "Senha",
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(25, 25, 0, 0),
                                width: 292.5,
                                height: 40.0,
                                child: TextFormField(
                                  initialValue: "",
                                  cursorColor: Colors.black,
                                  obscureText: true,
                                  enabled: _restaurantRegisterController
                                      .editInfo.value,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                      ),
                                    ),
                                    prefixIcon: Icon(Icons.password),
                                    labelText: "Confirme sua senha",
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(25, 25, 0, 0),
                                width: 300.0,
                                height: 40.0,
                                child: TextFormField(
                                  initialValue: (_restaurantRegisterController
                                          .restaurant.value.name ??
                                      ""),
                                  cursorColor: Colors.black,
                                  enabled: _restaurantRegisterController
                                      .editInfo.value,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                      ),
                                    ),
                                    prefixIcon: Icon(Icons.storefront),
                                    labelText: "Nome do restaurante",
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(25, 25, 0, 0),
                                width: 150.0,
                                height: 40.0,
                                child: TextFormField(
                                  initialValue: (_restaurantRegisterController
                                              .restaurant.value.capacity ==
                                          null
                                      ? ""
                                      : _restaurantRegisterController
                                          .restaurant.value.capacity
                                          .toString()),
                                  cursorColor: Colors.black,
                                  enabled: _restaurantRegisterController
                                      .editInfo.value,
                                  keyboardType: TextInputType.number,
                                  // maxLength: 3,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                        RegExp('[0-9]')),
                                  ],
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                      ),
                                    ),
                                    prefixIcon: Icon(Icons.groups),
                                    labelText: "Capacidade",
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(25, 25, 0, 0),
                                width: 205.0,
                                height: 40.0,
                                child: TextFormField(
                                  initialValue: (""),
                                  cursorColor: Colors.black,
                                  enabled: _restaurantRegisterController
                                      .editInfo.value,
                                  keyboardType: TextInputType.number,
                                  // maxLength: 3,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                        RegExp('[0-9]')),
                                  ],
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                      ),
                                    ),
                                    prefixIcon: Icon(Icons.schedule),
                                    labelText: "Abertura (H:M)",
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(25, 25, 0, 0),
                                width: 205.0,
                                height: 40.0,
                                child: TextFormField(
                                  initialValue: (""),
                                  cursorColor: Colors.black,
                                  enabled: _restaurantRegisterController
                                      .editInfo.value,
                                  keyboardType: TextInputType.number,
                                  // maxLength: 3,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                        RegExp('[0-9]')),
                                  ],
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                      ),
                                    ),
                                    prefixIcon: Icon(Icons.schedule),
                                    labelText: "Fechamento (H:M)",
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(25, 25, 0, 0),
                                width: 500.0,
                                height: 40.0,
                                child: TextFormField(
                                  initialValue: _restaurantRegisterController
                                          .restaurant.value.menu ??
                                      "",
                                  cursorColor: Colors.black,
                                  enabled: _restaurantRegisterController
                                      .editInfo.value,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    prefixIcon: Icon(Icons.link),
                                    labelText: "Link do menu",
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(25, 25, 0, 0),
                                width: 410.0,
                                height: 40.0,
                                child: TextFormField(
                                  initialValue: _restaurantRegisterController
                                          .restaurant.value.address ??
                                      "",
                                  cursorColor: Colors.black,
                                  enabled: _restaurantRegisterController
                                      .editInfo.value,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    prefixIcon: Icon(Icons.home),
                                    labelText: "Endereço",
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(25, 25, 0, 0),
                                width: 125.0,
                                height: 40.0,
                                child: TextFormField(
                                  initialValue: "",
                                  cursorColor: Colors.black,
                                  enabled: _restaurantRegisterController
                                      .editInfo.value,
                                  keyboardType: TextInputType.number,
                                  // maxLength: 3,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                      ),
                                    ),
                                    prefixIcon: Icon(Icons.pin_drop),
                                    labelText: "Número",
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(25, 25, 0, 0),
                                width: 195.0,
                                height: 40.0,
                                child: TextFormField(
                                  initialValue: "",
                                  cursorColor: Colors.black,
                                  obscureText: false,
                                  autofocus: true,
                                  enabled: _restaurantRegisterController
                                      .editInfo.value,
                                  keyboardType: TextInputType.number,
                                  // maxLength: 3,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                      ),
                                    ),
                                    prefixIcon: Icon(Icons.location_on),
                                    labelText: "CEP",
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(25, 25, 0, 0),
                                width: 270.0,
                                height: 40.0,
                                child: TextFormField(
                                  initialValue: "",
                                  cursorColor: Colors.black,
                                  enabled: _restaurantRegisterController
                                      .editInfo.value,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    prefixIcon: Icon(Icons.home),
                                    labelText: "Estado",
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(25, 25, 0, 0),
                                width: 270.0,
                                height: 40.0,
                                child: TextFormField(
                                  initialValue: "",
                                  cursorColor: Colors.black,
                                  enabled: _restaurantRegisterController
                                      .editInfo.value,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    prefixIcon: Icon(Icons.location_city),
                                    labelText: "Cidade",
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(25, 35, 5, 0),
                                width: 170.0,
                                height: 40.0,
                                child:
                                    _restaurantRegisterController.editInfo.value
                                        ? ElevatedButton(
                                            onPressed: () {
                                              _restaurantRegisterController
                                                  .saveForm();
                                            },
                                            child: Text(
                                              "Salvar",
                                              style: TextStyle(fontSize: 20.0),
                                            ),
                                          )
                                        : ElevatedButton(
                                            onPressed: () {
                                              _restaurantRegisterController
                                                  .editForm();
                                            },
                                            child: Text(
                                              "Editar",
                                              style: TextStyle(fontSize: 20.0),
                                            ),
                                          ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(5, 35, 15, 0),
                                width: 100.0,
                                height: 40.0,
                                child: TextButton(
                                  onPressed: () {
                                    Get.toNamed(Routes.LOGIN);
                                  },
                                  child: Text(
                                    "Voltar",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: Card(
                      elevation: 15.0,
                      child: Container(
                        width: 250.0,
                        height: 280.0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "QRCODE - RESERVA:",
                              style: TextStyle(
                                fontSize: 20.0,
                              ),
                            ),
                            QrImage(
                              data: _restaurantRegisterController
                                      .restaurant.value.name ??
                                  "",
                              version: QrVersions.auto,
                              size: 200.0,
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              child: Text(
                                "Imprimir",
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
