import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sit_eat_web/app/controller/restaurant_register_controller.dart';
import 'package:sit_eat_web/app/routes/app_pages.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ProfilePage extends GetView<RestaurantRegisterController> {
  final RestaurantRegisterController _restaurantRegisterController =
      Get.put(RestaurantRegisterController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black87,
      appBar: AppBar(
        title: Text("Minha conta"),
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.black87,
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountEmail: Text(_restaurantRegisterController.email),
                accountName: Text("Bem vindo " +
                    _restaurantRegisterController.nameRestaurant),
                currentAccountPicture: CircleAvatar(
                  child: Text("Empresa"),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                title: Text(
                  "Minha conta",
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Get.toNamed(Routes.RESTAURANT_PROFILE);
                  // Navigator.pop(context);
                  //Navegar para outra página
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.shopping_basket,
                  color: Colors.white,
                ),
                title: Text(
                  "Cadastrar produto",
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Get.toNamed(Routes.PRODUCT_REGISTER);
                  //Navegar para outra página
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.favorite,
                  color: Colors.white,
                ),
                title: Text(
                  "Favoritos",
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.pop(context);
                  //Navegar para outra página
                },
              ),
            ],
          ),
        ),
      ),
      body: Container(
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
                                initialValue:
                                    _restaurantRegisterController.email,
                                cursorColor: Colors.black,
                                obscureText: false,
                                autofocus: true,
                                enabled:
                                    _restaurantRegisterController.editInfo.value
                                        ? true
                                        : false,
                                // enabled: _restaurantRegisterController
                                //     .editInfo.value,
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
                                initialValue:
                                    _restaurantRegisterController.password,
                                cursorColor: Colors.black,
                                obscureText: true,
                                autofocus: true,
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
                                initialValue: _restaurantRegisterController
                                    .confirmPassword,
                                cursorColor: Colors.black,
                                obscureText: true,
                                autofocus: true,
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
                                initialValue: _restaurantRegisterController
                                    .nameRestaurant,
                                cursorColor: Colors.black,
                                obscureText: false,
                                autofocus: true,
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
                                initialValue:
                                    _restaurantRegisterController.capacity,
                                cursorColor: Colors.black,
                                obscureText: false,
                                autofocus: true,
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
                              child: DropdownSearch<String>(
                                hint: "Selecione o horário",
                                mode: Mode.MENU,
                                showSelectedItem: true,
                                showSearchBox: true,
                                enabled: _restaurantRegisterController
                                    .editInfo.value,
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
                                label: _restaurantRegisterController.openTime,
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
                                enabled: _restaurantRegisterController
                                    .editInfo.value,
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
                                label: _restaurantRegisterController.closeTime,
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
                              child: TextFormField(
                                initialValue:
                                    _restaurantRegisterController.linkMenu,
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
                                initialValue:
                                    _restaurantRegisterController.address,
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
                                initialValue:
                                    _restaurantRegisterController.number,
                                cursorColor: Colors.black,
                                obscureText: false,
                                autofocus: true,
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
                                initialValue:
                                    _restaurantRegisterController.zipCode,
                                cursorColor: Colors.black,
                                obscureText: false,
                                autofocus: true,
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
                                enabled: _restaurantRegisterController
                                    .editInfo.value,
                                searchBoxDecoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 10),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    hintText: "Pesquise seu estado"),
                                items: _restaurantRegisterController.states,
                                label: _restaurantRegisterController.state,
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
                              child: TextFormField(
                                initialValue:
                                    _restaurantRegisterController.city,
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
                              child: ElevatedButton(
                                onPressed: () {
                                  // _restaurantRegisterController.editInfo =
                                  //     false.obs;
                                  // _restaurantRegisterController
                                  //     .registerMocked();
                                  // Get.toNamed(Routes.LOGIN);
                                  // _registerRestaurantController.createRestaurant();
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
                          ),
                          QrImage(
                            data: _restaurantRegisterController.nameRestaurant,
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
    );
  }
}
