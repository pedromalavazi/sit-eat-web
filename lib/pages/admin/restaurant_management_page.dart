import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sit_eat_web/app/controller/restaurant_manage_controller.dart';
import 'package:sit_eat_web/pages/admin/widgets/restaurant_card.dart';
import 'package:sit_eat_web/utils/menu.dart';

class RestaurantManagementPage extends GetView<RestaurantManagementController> {
  final RestaurantManagementController _restaurantManagementController = Get.find<RestaurantManagementController>();

  @override
  Widget build(BuildContext context) {
    return Menu(
      title: "Restaurant Management",
      body: _body(),
    );
  }

  _body() {
    return ListView(
      children: [
        Wrap(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 500,
                        height: 60,
                        child: Card(
                          elevation: 15.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: TextField(
                              style: TextStyle(fontSize: 20.0),
                              // controller: _restaurantManagementController.restaurantNameTextController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                prefixIcon: Padding(
                                  padding: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 5.0),
                                  child: CircleAvatar(
                                    radius: 20.0,
                                    backgroundColor: Colors.red,
                                    child: Icon(
                                      Icons.search,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                hintText: "Pesquisar restaurantes",
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Obx(
                  () => Wrap(
                    children: List.generate(
                      _restaurantManagementController.listRestaurants.length,
                      (index) => RestaurantCard(restaurant: _restaurantManagementController.listRestaurants[index]),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
