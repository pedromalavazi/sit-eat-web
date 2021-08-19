import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sit_eat_web/app/controller/register_restaurant_controller.dart';
import 'package:sit_eat_web/app/routes/app_pages.dart';
import 'package:dropdown_search/dropdown_search.dart';

class RegisterPage extends GetView<RegisterRestaurantController> {
  final RegisterRestaurantController _registerRestaurantController =
      Get.put(RegisterRestaurantController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(200),
        child: Center(
          child: Form(
            key: _formKey,
            child: Container(
              width: 950,
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
                            controller: _registerRestaurantController
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
                              labelText: "E-mail",
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(25, 25, 0, 0),
                          width: 273.0,
                          height: 40.0,
                          child: TextField(
                            controller: _registerRestaurantController
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
                              labelText: "Senha",
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(25, 25, 0, 0),
                          width: 273.0,
                          height: 40.0,
                          child: TextField(
                            controller: _registerRestaurantController
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
                            controller: _registerRestaurantController
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
                              labelText: "Nome do restaurante",
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(25, 25, 0, 0),
                          width: 110.0,
                          height: 40.0,
                          child: TextField(
                            controller: _registerRestaurantController
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
                            searchBoxDecoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                hintText: "Pesquise o horário"),
                            items: _registerRestaurantController.horary,
                            label: "Horário de abertura",
                            showClearButton: true,
                            onChanged: print,
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
                            searchBoxDecoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                hintText: "Pesquise o horário"),
                            items: _registerRestaurantController.horary,
                            label: "Horário de fechamento",
                            showClearButton: true,
                            onChanged: print,
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
                            controller: _registerRestaurantController
                                .addressTextController,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Endereço",
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(25, 25, 0, 0),
                          width: 125.0,
                          height: 40.0,
                          child: TextField(
                            controller: _registerRestaurantController
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
                              labelText: "Número",
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(25, 25, 0, 0),
                          width: 220.0,
                          height: 40.0,
                          child: TextField(
                            controller: _registerRestaurantController
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
                              labelText: "CEP",
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(25, 25, 0, 0),
                          width: 250.0,
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
                            items: _registerRestaurantController.states,
                            label: "Estado",
                            showClearButton: true,
                            onChanged: print,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(25, 25, 0, 0),
                          width: 250.0,
                          height: 40.0,
                          child: TextField(
                            controller: _registerRestaurantController
                                .cityTextController,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
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
        ),
      ),
    );
  }
}
