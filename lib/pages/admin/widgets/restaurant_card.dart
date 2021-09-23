import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sit_eat_web/app/controller/restaurant_manage_controller.dart';
import 'package:sit_eat_web/app/data/model/restaurant_model.dart';

class RestaurantCard extends StatelessWidget {
  // final RestaurantManagementController _restaurantManagementController = Get.find<RestaurantManagementController>();
  // final RestaurantModel restaurant;
  final RestaurantModel restaurant;

  RestaurantCard({required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        width: 600,
        height: 150,
        child: Card(
          // color: Colors.lightBlue[300],
          elevation: 15.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.all(9.0),
                child: Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(restaurant.image ?? ""),
                    ),
                  ),
                ),
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 220,
                      child: Text(
                        restaurant.name ?? "Olá",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Flexible(
                      child: SingleChildScrollView(
                        child: Container(
                          width: 230,
                          child: Text(
                            restaurant.capacity.toString(),
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Text(
                    restaurant.city.toString(),
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Get.dialog(
                        AlertDialog(
                          content: Form(
                            child: Container(
                              width: 280,
                              height: 80,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Deseja realmente excluir este produto?",
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
                                            // _productsController.delete(product.id);
                                          },
                                          child: Text(
                                            "Excluir",
                                            style: TextStyle(fontSize: 18.0),
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
                    child: Icon(Icons.delete),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
