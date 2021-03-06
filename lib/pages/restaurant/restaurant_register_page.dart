import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sit_eat_web/app/controller/restaurant_register_controller.dart';
import 'package:sit_eat_web/app/routes/app_pages.dart';

class RestaurantRegisterPage extends GetView<RestaurantRegisterController> {
  final RestaurantRegisterController _registerRestaurantController = Get.find<RestaurantRegisterController>();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage("background-restaurante.jpg"),
              fit: BoxFit.fill,
            ),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
            child: Center(
              child: Form(
                key: _formKey,
                child: Wrap(
                  children: [
                    Container(
                      width: 990,
                      child: Card(
                        elevation: 15.0,
                        child: Container(
                          margin: EdgeInsets.fromLTRB(0, 35, 0, 35),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(10, 0, 10, 15),
                                    child: SizedBox(
                                      width: 50,
                                      height: 50,
                                      child: Image.asset("assets/logo-only.png"),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(10, 0, 10, 15),
                                    child: Text(
                                      "Sit & Eat",
                                      style: TextStyle(
                                        fontSize: 23.0,
                                        fontWeight: FontWeight.bold,
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
                                    height: 42.0,
                                    child: TextField(
                                      controller: _registerRestaurantController.emailTextController,
                                      cursorColor: Colors.black,
                                      obscureText: false,
                                      autofocus: true,
                                      decoration: InputDecoration(
                                        isDense: true,
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
                                    width: 292.0,
                                    height: 42.0,
                                    child: TextField(
                                      controller: _registerRestaurantController.passwordTextController,
                                      cursorColor: Colors.black,
                                      obscureText: true,
                                      autofocus: true,
                                      decoration: InputDecoration(
                                        isDense: true,
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
                                    width: 292.0,
                                    height: 42.0,
                                    child: TextField(
                                      controller: _registerRestaurantController.confirmPasswordTextController,
                                      cursorColor: Colors.black,
                                      obscureText: true,
                                      autofocus: true,
                                      decoration: InputDecoration(
                                        isDense: true,
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
                                    height: 42.0,
                                    child: TextField(
                                      controller: _registerRestaurantController.nameTextController,
                                      cursorColor: Colors.black,
                                      obscureText: false,
                                      autofocus: true,
                                      decoration: InputDecoration(
                                        isDense: true,
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
                                    height: 42.0,
                                    child: TextField(
                                      controller: _registerRestaurantController.capacityTextController,
                                      cursorColor: Colors.black,
                                      obscureText: false,
                                      autofocus: true,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        isDense: true,
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
                                    height: 42.0,
                                    child: TextField(
                                      controller: _registerRestaurantController.openTimeTextController,
                                      cursorColor: Colors.black,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        isDense: true,
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
                                    height: 42.0,
                                    child: TextField(
                                      controller: _registerRestaurantController.closeTimeTextController,
                                      cursorColor: Colors.black,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                          ),
                                        ),
                                        prefixIcon: Icon(Icons.schedule),
                                        labelText: "Fechamento(H:M)",
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(25, 25, 0, 0),
                                    width: 130.0,
                                    height: 40.0,
                                    child: TextFormField(
                                      controller: _registerRestaurantController.imageTextController,
                                      cursorColor: Colors.black,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        prefixIcon: Icon(Icons.image),
                                        labelText: "Imagem",
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(25, 25, 0, 0),
                                    width: 50.0,
                                    height: 40.0,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        if (_registerRestaurantController.editInfo.value) {
                                          _registerRestaurantController.pickImage();
                                        }
                                      },
                                      child: Icon(
                                        Icons.image_search,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(25, 25, 0, 0),
                                    width: 300.0,
                                    height: 42.0,
                                    child: TextField(
                                      controller: _registerRestaurantController.menuTextController,
                                      cursorColor: Colors.black,
                                      keyboardType: TextInputType.streetAddress,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        border: OutlineInputBorder(),
                                        prefixIcon: Icon(Icons.link),
                                        labelText: "Link do menu",
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(25, 25, 0, 0),
                                    width: 380.0,
                                    height: 42.0,
                                    child: TextField(
                                      controller: _registerRestaurantController.addressTextController,
                                      cursorColor: Colors.black,
                                      keyboardType: TextInputType.streetAddress,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        border: OutlineInputBorder(),
                                        prefixIcon: Icon(Icons.home),
                                        labelText: "Endere??o",
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
                                    height: 42.0,
                                    child: TextField(
                                      controller: _registerRestaurantController.numberTextController,
                                      cursorColor: Colors.black,
                                      obscureText: false,
                                      autofocus: true,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                          ),
                                        ),
                                        prefixIcon: Icon(Icons.pin_drop),
                                        labelText: "N??mero",
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(25, 25, 0, 0),
                                    width: 195.0,
                                    height: 42.0,
                                    child: TextField(
                                      controller: _registerRestaurantController.zipCodeTextController,
                                      cursorColor: Colors.black,
                                      obscureText: false,
                                      autofocus: true,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        isDense: true,
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
                                    height: 42.0,
                                    child: TextField(
                                      controller: _registerRestaurantController.stateTextController,
                                      cursorColor: Colors.black,
                                      keyboardType: TextInputType.streetAddress,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                          ),
                                        ),
                                        prefixIcon: Icon(Icons.home),
                                        labelText: "Estado",
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(25, 25, 0, 0),
                                    width: 270.0,
                                    height: 42.0,
                                    child: TextField(
                                      controller: _registerRestaurantController.cityTextController,
                                      cursorColor: Colors.black,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        border: OutlineInputBorder(),
                                        prefixIcon: Icon(Icons.location_city),
                                        labelText: "Cidade",
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(25, 35, 5, 0),
                                    width: 150.0,
                                    height: 40.0,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        _registerRestaurantController.register();
                                      },
                                      child: Text(
                                        "Cadastrar",
                                        style: TextStyle(fontSize: 20.0),
                                      ),
                                      style: ButtonStyle(
                                        backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.red),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(5, 35, 15, 0),
                                    width: 100.0,
                                    height: 40.0,
                                    child: TextButton(
                                      onPressed: () {
                                        Get.offAllNamed(Routes.LOGIN);
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
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
