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
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20, bottom: 20),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // position
                    ),
                  ],
                ),
                child: TextField(
                  controller: _restaurantManagementController
                      .restaurantNameTextController,
                  keyboardType: TextInputType.text,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    contentPadding: EdgeInsets.all(15),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 15, right: 15),
                      child: CircleAvatar(
                        backgroundColor: Colors.red,
                        child: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    hintText: "Pesquisar restaurantes",
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            Obx(
              () => Expanded(
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
                        double font = fontSize(constraints.maxHeight * 0.1,
                            min: 10, max: 20);

                        return InkWell(
                          onTap: () {
                            Get.toNamed(Routes.RESTAURANT_APPROVAL,
                                arguments: _restaurantManagementController
                                    .listRestaurants[index].id);
                          },
                          child: Obx(
                            () => Card(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    children: [
                                      ConstrainedBox(
                                        constraints:
                                            BoxConstraints(maxWidth: 200),
                                        child: Container(
                                          margin: EdgeInsets.only(
                                              right: 50, left: 50),
                                          width: 180,
                                          height: 150,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            // Logo image restaurante
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                _restaurantManagementController
                                                        .listRestaurants[index]
                                                        .image ??
                                                    'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6c/No_image_3x4.svg/1200px-No_image_3x4.svg.png',
                                              ),
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            _restaurantManagementController
                                                    .listRestaurants[index]
                                                    .name ??
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
                                                style:
                                                    TextStyle(fontSize: font),
                                              ),
                                              Text(
                                                _restaurantManagementController
                                                        .listRestaurants[index]
                                                        .address ??
                                                    "", //Dias da semana
                                                overflow: TextOverflow.ellipsis,
                                                style:
                                                    TextStyle(fontSize: font),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        //Checkbox de Validação
                                        children: <Widget>[
                                          (_restaurantManagementController
                                                      .listRestaurants[index]
                                                      .active ??
                                                  false)
                                              ? TextButton(
                                                  style: TextButton.styleFrom(
                                                      backgroundColor:
                                                          Colors.green,
                                                      elevation: 15,
                                                      shadowColor: Colors.green,
                                                      padding:
                                                          EdgeInsets.all(16),
                                                      primary: Colors.white,
                                                      textStyle: TextStyle(
                                                          fontSize: font)),
                                                  onPressed: () {},
                                                  child: Text("Ativo"),
                                                )
                                              : TextButton(
                                                  style: TextButton.styleFrom(
                                                      backgroundColor:
                                                          Colors.red,
                                                      elevation: 15,
                                                      shadowColor: Colors.red,
                                                      padding:
                                                          EdgeInsets.all(16),
                                                      primary: Colors.white,
                                                      textStyle: TextStyle(
                                                          fontSize: font)),
                                                  onPressed: () {},
                                                  child: Text("Inativo"),
                                                )
                                        ],
                                      ),
                                      SizedBox(width: 200),
                                    ],
                                  ),
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
          ],
        ),
      ),
    );
  }
}
