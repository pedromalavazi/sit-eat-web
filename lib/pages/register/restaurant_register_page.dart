import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sit_eat_web/app/controller/restaurant_register_controller.dart';
import 'package:sit_eat_web/app/routes/app_pages.dart';
import 'package:dropdown_search/dropdown_search.dart';

class RestaurantRegisterPage extends GetView<RestaurantRegisterController> {
  final RestaurantRegisterController _restaurantRegisterController =
      Get.put(RestaurantRegisterController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              key: _formKey,
              child: Container(
                width: 990,
                height: 520,
                child: Card(
                  elevation: 15.0,
                  child: Wrap(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(25, 25, 0, 30),
                        child: SizedBox(
                          width: 50,
                          height: 50,
                          child: Image.asset("assets/logo-only.png"),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(10, 40, 0, 30),
                        child: Text(
                          "Sit & Eat",
                          style: TextStyle(
                            fontSize: 23.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(25, 0, 0, 10),
                            child: Text(
                              "Preecha os campos abaixo para cadastrar seu restaurante",
                              style: TextStyle(
                                fontSize: 15.0,
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
                            height: 40.0,
                            child: TextField(
                              controller: _restaurantRegisterController
                                  .emailTextController,
                              cursorColor: Colors.black,
                              obscureText: false,
                              autofocus: true,
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
                            child: TextField(
                              controller: _restaurantRegisterController
                                  .passwordTextController,
                              cursorColor: Colors.black,
                              obscureText: true,
                              autofocus: true,
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
                            child: TextField(
                              controller: _restaurantRegisterController
                                  .confirmPasswordTextController,
                              cursorColor: Colors.black,
                              obscureText: true,
                              autofocus: true,
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
                            child: TextField(
                              controller: _restaurantRegisterController
                                  .nameTextController,
                              cursorColor: Colors.black,
                              obscureText: false,
                              autofocus: true,
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
                            child: TextField(
                              controller: _restaurantRegisterController
                                  .capacityTextController,
                              cursorColor: Colors.black,
                              obscureText: false,
                              autofocus: true,
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
                            child: DropdownSearch<String>(
                              hint: "Selecione o horário",
                              mode: Mode.MENU,
                              showSelectedItem: true,
                              showSearchBox: true,
                              // dropdownSearchDecoration: InputDecoration(
                              //   prefixIcon: Icon(Icons.schedule),
                              //   border: OutlineInputBorder(),
                              // ),
                              searchBoxDecoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                hintText: "Pesquise o horário",
                              ),
                              items: _restaurantRegisterController.horary,
                              label: "Horário de abertura",
                              showClearButton: true,
                              onChanged: (value) =>
                                  _restaurantRegisterController
                                      .openTimeTextController
                                      .text = value.toString(),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(25, 25, 0, 0),
                            width: 205.0,
                            height: 40.0,
                            child: DropdownSearch<String>(
                              hint: "Selecione o horário",
                              mode: Mode.MENU,
                              showSelectedItem: true,
                              showSearchBox: true,
                              // dropdownSearchDecoration: InputDecoration(
                              //   prefixIcon: Icon(Icons.schedule),
                              //   border: OutlineInputBorder(),
                              // ),
                              searchBoxDecoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 10,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  hintText: "Pesquise o horário"),
                              items: _restaurantRegisterController.horary,
                              label: "Horário de fechamento",
                              showClearButton: true,
                              onChanged: (value) =>
                                  _restaurantRegisterController
                                      .closeTimeTextController
                                      .text = value.toString(),
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
                            child: TextField(
                              controller: _restaurantRegisterController
                                  .menuTextController,
                              cursorColor: Colors.black,
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
                            child: TextField(
                              controller: _restaurantRegisterController
                                  .addressTextController,
                              cursorColor: Colors.black,
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
                            child: TextField(
                              controller: _restaurantRegisterController
                                  .numberTextController,
                              cursorColor: Colors.black,
                              obscureText: false,
                              autofocus: true,
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
                                prefixIcon: Icon(Icons.pin_drop),
                                labelText: "Número",
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(25, 25, 0, 0),
                            width: 195.0,
                            height: 40.0,
                            child: TextField(
                              controller: _restaurantRegisterController
                                  .zipCodeTextController,
                              cursorColor: Colors.black,
                              obscureText: false,
                              autofocus: true,
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
                                prefixIcon: Icon(Icons.location_on),
                                labelText: "CEP",
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(25, 25, 0, 0),
                            width: 270.0,
                            height: 40.0,
                            child: DropdownSearch<String>(
                              validator: (v) =>
                                  v == null ? "required field" : null,
                              hint: "Selecione o estado",
                              mode: Mode.MENU,
                              showSelectedItem: true,
                              showSearchBox: true,
                              searchBoxDecoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  hintText: "Pesquise seu estado"),
                              items: _restaurantRegisterController.states,
                              label: "Estado",
                              showClearButton: true,
                              onChanged: (value) =>
                                  _restaurantRegisterController
                                      .stateTextController
                                      .text = value.toString(),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(25, 25, 0, 0),
                            width: 270.0,
                            height: 40.0,
                            child: TextField(
                              controller: _restaurantRegisterController
                                  .cityTextController,
                              cursorColor: Colors.black,
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
                            width: 150.0,
                            height: 40.0,
                            child: ElevatedButton(
                              onPressed: () {
                                _restaurantRegisterController.registerMocked();
                                Get.toNamed(Routes.LOGIN);
                                // _registerRestaurantController.createRestaurant();
                              },
                              child: Text(
                                "Cadastrar",
                                style: TextStyle(fontSize: 20.0),
                              ),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith(
                                        (states) => Colors.red),
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
            ),
          ],
        ),
      ),
    );
  }
}
