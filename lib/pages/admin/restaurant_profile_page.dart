import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:sit_eat_web/app/controller/restaurant_profile_controller.dart';
import 'package:sit_eat_web/app/controller/restaurant_register_controller.dart';
import 'package:sit_eat_web/app/routes/app_pages.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ProfilePage extends GetView<RestaurantRegisterController> {
  final RestaurantRegisterController _restaurantRegisterController =
      Get.put(RestaurantRegisterController());
  // final RestaurantProfileController _restaurantProfileController =
  //     Get.put(RestaurantProfileController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black87,
      appBar: AppBar(
        title: Text("DashBoard"),
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
                  child: Text("SZ"),
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
                  Get.toNamed(Routes.RESTAURANT_REGISTER);
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
                  "Meus pedidos",
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.pop(context);
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
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 900,
              height: 500,
              child: Card(
                elevation: 20.0,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(25, 25, 0, 0),
                          width: 300.0,
                          height: 40.0,
                          child: TextFormField(
                            initialValue: _restaurantRegisterController.email,
                            cursorColor: Colors.black,
                            obscureText: false,
                            autofocus: false,
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
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 150.0),
            Container(
              width: 300,
              height: 300,
              child: Card(
                elevation: 20.0,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(25, 25, 0, 0),
                          width: 200.0,
                          height: 40.0,
                          child: Text("Olá"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // Container(
            //   child: Row(
            //     children: [
            //       QrImage(
            //         data: _restaurantRegisterController.nameRestaurant,
            //         version: QrVersions.auto,
            //         size: 200.0,
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
      // body: Center(
      //   child: Container(
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         Text("Email: " + _restaurantRegisterController.email),
      //         Text("Password: " + _restaurantRegisterController.password),
      //         Text("Confirmação do password: " +
      //             _restaurantRegisterController.confirmPassword),
      //         Text("Nome do restaurante: " +
      //             _restaurantRegisterController.nameRestaurant),
      //         Text("Capacity: " + _restaurantRegisterController.capacity),
      //         Text("Open time: " + _restaurantRegisterController.openTime),
      //         Text("Close time: " + _restaurantRegisterController.closeTime),
      //         Text("Link do menu: " + _restaurantRegisterController.linkMenu),
      //         Text("Address: " + _restaurantRegisterController.address),
      //         Text("Number: " + _restaurantRegisterController.number),
      //         Text("Zip Code: " + _restaurantRegisterController.zipCode),
      //         Text("State: " + _restaurantRegisterController.state),
      //         Text("City: " + _restaurantRegisterController.city),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
