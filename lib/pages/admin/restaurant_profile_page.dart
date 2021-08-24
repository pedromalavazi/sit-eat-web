import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:sit_eat_web/app/controller/restaurant_profile_controller.dart';
import 'package:sit_eat_web/app/controller/restaurant_register_controller.dart';
import 'package:sit_eat_web/app/routes/app_pages.dart';

class ProfilePage extends GetView<RestaurantRegisterController> {
  final RestaurantRegisterController _restaurantRegisterController =
      Get.put(RestaurantRegisterController());
  // final RestaurantProfileController _restaurantProfileController =
  //     Get.put(RestaurantProfileController());
  final _formKey = GlobalKey<FormState>();
  int count = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DashBoard"),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountEmail: Text(_restaurantRegisterController.email),
              accountName: Text(
                  "Bem vindo " + _restaurantRegisterController.nameRestaurant),
              currentAccountPicture: CircleAvatar(
                child: Text("SZ"),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Minha conta"),
              onTap: () {
                Get.toNamed(Routes.RESTAURANT_REGISTER);
                // Navigator.pop(context);
                //Navegar para outra página
              },
            ),
            ListTile(
              leading: Icon(Icons.shopping_basket),
              title: Text("Meus pedidos"),
              onTap: () {
                Navigator.pop(context);
                //Navegar para outra página
              },
            ),
            ListTile(
              leading: Icon(Icons.favorite),
              title: Text("Favoritos"),
              onTap: () {
                Navigator.pop(context);
                //Navegar para outra página
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Container(
          child: Column(
            // email = emailTextController.text.trim();
            // password = passwordTextController.text.trim();
            // confirmPassword = confirmPasswordTextController.text.trim();
            // nameRestaurant = nameTextController.text.trim();
            // capacity = capacityTextController.text.trim();
            // openTime = openTimeTextController.text.trim();
            // closeTime = closeTimeTextController.text.trim();
            // linkMenu = menuTextController.text.trim();
            // address = addressTextController.text.trim();
            // number = numberTextController.text.trim();
            // zipCode = zipCodeTextController.text.trim();
            // state = stateTextController.text.trim();
            // city = cityTextController.text.trim();
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Email: " + _restaurantRegisterController.email),
              Text("Password: " + _restaurantRegisterController.password),
              Text("Confirmação do password: " +
                  _restaurantRegisterController.confirmPassword),
              Text("Nome do restaurante: " +
                  _restaurantRegisterController.nameRestaurant),
              Text("Capacity: " + _restaurantRegisterController.capacity),
              Text("Open time: " + _restaurantRegisterController.openTime),
              Text("Close time: " + _restaurantRegisterController.closeTime),
              Text("Link do menu: " + _restaurantRegisterController.linkMenu),
              Text("Address: " + _restaurantRegisterController.address),
              Text("Number: " + _restaurantRegisterController.number),
              Text("Zip Code: " + _restaurantRegisterController.zipCode),
              Text("State: " + _restaurantRegisterController.state),
              Text("City: " + _restaurantRegisterController.city),
            ],
          ),
        ),
      ),
    );
  }
}
