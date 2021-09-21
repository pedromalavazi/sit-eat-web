import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:sit_eat_web/app/controller/restaurant_profile_controller.dart';
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
                    height: 440,
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
                                  controller: _restaurantRegisterController
                                      .emailTetController,
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
                                  controller: _restaurantRegisterController
                                      .passwordTextController,
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
                                  controller: _restaurantRegisterController
                                      .confirmPasswordTextController,
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
                                  controller: _restaurantRegisterController
                                      .nameTextController,
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
                                  controller: _restaurantRegisterController
                                      .capacityTextController,
                                  cursorColor: Colors.black,
                                  enabled: _restaurantRegisterController
                                      .editInfo.value,
                                  keyboardType: TextInputType.number,
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
                                  controller: _restaurantRegisterController
                                      .openTimeTextController,
                                  cursorColor: Colors.black,
                                  enabled: _restaurantRegisterController
                                      .editInfo.value,
                                  keyboardType: TextInputType.number,
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
                                  controller: _restaurantRegisterController
                                      .closeTimeTextController,
                                  cursorColor: Colors.black,
                                  enabled: _restaurantRegisterController
                                      .editInfo.value,
                                  keyboardType: TextInputType.number,
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
                                  controller: _restaurantRegisterController
                                      .menuTextController,
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
                                  controller: _restaurantRegisterController
                                      .addressTextController,
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
                                  controller: _restaurantRegisterController
                                      .numberTextController,
                                  cursorColor: Colors.black,
                                  enabled: _restaurantRegisterController
                                      .editInfo.value,
                                  keyboardType: TextInputType.number,
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
                                  controller: _restaurantRegisterController
                                      .zipCodeTextController,
                                  cursorColor: Colors.black,
                                  enabled: _restaurantRegisterController
                                      .editInfo.value,
                                  keyboardType: TextInputType.number,
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
                                  controller: _restaurantRegisterController
                                      .stateTextController,
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
                                  controller: _restaurantRegisterController
                                      .cityTextController,
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
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(25, 25, 0, 0),
                                width: 500.0,
                                height: 40.0,
                                child: TextFormField(
                                  controller: _restaurantRegisterController
                                      .imageTextController,
                                  cursorColor: Colors.black,
                                  enabled: _restaurantRegisterController
                                      .editInfo.value,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    prefixIcon: Icon(Icons.image),
                                    labelText: "Imagem",
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(25, 25, 0, 0),
                                width: 60.0,
                                height: 40.0,
                                child: ElevatedButton(
                                  style: _restaurantRegisterController
                                          .editInfo.value
                                      ? ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.resolveWith(
                                                  (states) => Colors.red),
                                        )
                                      : ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.resolveWith(
                                                  (states) => Colors.grey),
                                        ),
                                  onPressed: () {
                                    if (_restaurantRegisterController
                                        .editInfo.value) {
                                      _restaurantRegisterController.pickImage();
                                    }
                                  },
                                  child: Icon(
                                    Icons.image_search,
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
                                        ? RoundedLoadingButton(
                                            child: Text(
                                              "Salvar",
                                              style: TextStyle(fontSize: 20.0),
                                            ),
                                            color: Colors.red,
                                            successColor: Colors.green,
                                            controller:
                                                _restaurantRegisterController
                                                    .saveButtonController,
                                            onPressed: () =>
                                                _restaurantRegisterController
                                                    .saveForm(),
                                            borderRadius: 5,
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
                            QrImage(
                              //TODO: ajustar quando serviço de QR Code estiver pronto
                              data: "",
                              version: QrVersions.auto,
                              size: 200.0,
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              child: Icon(
                                Icons.print,
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
