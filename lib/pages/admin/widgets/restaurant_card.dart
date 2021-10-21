import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sit_eat_web/app/data/model/restaurant_model.dart';
import 'package:sit_eat_web/app/routes/app_pages.dart';

class RestaurantCard extends StatelessWidget {
  final RestaurantModel restaurant;

  RestaurantCard({required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: 500,
        height: 150,
        child: InkWell(
          focusColor: Colors.red,
          borderRadius: BorderRadius.circular(15),
          onTap: () {
            Get.toNamed(Routes.RESTAURANT_APPROVAL, arguments: restaurant.id);
          },
          child: Card(
            elevation: 15.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
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
                        width: 250,
                        child: Text(
                          restaurant.name ?? "",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        width: 250,
                        child: Text(
                          restaurant.address ?? "",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: (restaurant.active ?? false)
                          ? Icon(
                              Icons.check_circle,
                              color: Colors.green,
                              size: 50.0,
                            )
                          : Icon(
                              Icons.cancel,
                              color: Colors.red,
                              size: 50.0,
                            )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
