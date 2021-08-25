import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sit_eat_web/app/controller/restaurant_manage_controller.dart';
import 'package:sit_eat_web/app/routes/app_pages.dart';
import 'package:sit_eat_web/utils/menu.dart';
import 'package:sit_eat_web/utils/web_utils.dart';

class RestaurantManagementPage extends GetView<RestaurantManagementController> {
  final RestaurantManagementController _restaurantManagementController =
      Get.find<RestaurantManagementController>();

  @override
  Widget build(BuildContext context) {
    return Menu(
      title: "Restaurant Management",
      body: _body(),
    );
  }

  _body() {
    return Container(
      child: Obx(
        () => Container(
          child: GridView.builder(
            itemCount: _restaurantManagementController.listRestaurants
                .length, //Quantidade de Restaurante para aprovar
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 7.0,
              crossAxisCount: 1,
              crossAxisSpacing: 20,
            ),
            itemBuilder: (context, index) {
              return LayoutBuilder(
                builder: (context, constraints) {
                  double font =
                      fontSize(constraints.maxHeight * 0.1, min: 10, max: 20);

                  return InkWell(
                    onTap: () {
                      Get.toNamed(Routes.RESTAURANT_APPROVAL,
                          arguments: _restaurantManagementController
                              .listRestaurants[index].id);
                    },
                    child: Obx(
                      () => Card(
                        child: Row(
                          children: <Widget>[
                            ConstrainedBox(
                              constraints: BoxConstraints(maxWidth: 200),
                              child: Container(
                                margin: EdgeInsets.only(right: 50, left: 50),
                                width: 180,
                                height: 150,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  // Logo image restaurante
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      _restaurantManagementController
                                              .listRestaurants[index].image ??
                                          'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6c/No_image_3x4.svg/1200px-No_image_3x4.svg.png',
                                    ),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  _restaurantManagementController
                                          .listRestaurants[index].name ??
                                      "", //Nome do Restaurante
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: font,
                                      fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Endereço: ", //Dias da semana
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(fontSize: font),
                                    ),
                                    Text(
                                      _restaurantManagementController
                                              .listRestaurants[index].address ??
                                          "", //Dias da semana
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(fontSize: font),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(width: 230),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              //Checkbox de Validação
                              children: <Widget>[
                                (_restaurantManagementController
                                            .listRestaurants[index].active ??
                                        false)
                                    ? TextButton(
                                        style: TextButton.styleFrom(
                                            backgroundColor: Colors.green,
                                            elevation: 15,
                                            shadowColor: Colors.green,
                                            padding: EdgeInsets.all(16),
                                            primary: Colors.white,
                                            textStyle:
                                                TextStyle(fontSize: font)),
                                        onPressed: () {},
                                        child: Text("Ativo"),
                                      )
                                    : TextButton(
                                        style: TextButton.styleFrom(
                                            backgroundColor: Colors.red,
                                            elevation: 15,
                                            shadowColor: Colors.red,
                                            padding: EdgeInsets.all(16),
                                            primary: Colors.white,
                                            textStyle:
                                                TextStyle(fontSize: font)),
                                        onPressed: () {},
                                        child: Text("Inativo"),
                                      )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
