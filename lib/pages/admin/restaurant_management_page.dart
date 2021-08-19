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
    return GridView.builder(
      itemCount: 10, //Quantidade de Restaurante para aprovar
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
                Get.toNamed(Routes.RESTAURANT_APPROVAL);
              },
              child: Card(
                child: Row(
                  children: <Widget>[
                    ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: 200),
                      child: Container(
                        child: Image.network(
                            "https://4cpatiobatel.crmall.com/Api/store/image/Y2Uvc09LRXVZZzExZElBUUlXZEZiUT09"), //Logo do Restaurante
                        padding: EdgeInsets.all(15),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Madero", //Nome do Restaurante
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: font, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Horario: 16h - 22h", //Horario de funcionamento
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: font),
                        ),
                        Text(
                          "Endereço: Rua Antonio Marques Serra", //Dias da semana
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: font),
                        ),
                      ],
                    ),
                    SizedBox(width: 230),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      //Checkbox de Validação
                      children: <Widget>[
                        TextButton(
                          style: TextButton.styleFrom(
                              backgroundColor: Colors.green,
                              elevation: 15,
                              shadowColor: Colors.green,
                              padding: EdgeInsets.all(16),
                              primary: Colors.white,
                              textStyle: TextStyle(fontSize: font)),
                          onPressed: () {},
                          child: Text("Ativo"),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                              backgroundColor: Colors.red,
                              elevation: 15,
                              shadowColor: Colors.red,
                              padding: EdgeInsets.all(16),
                              primary: Colors.white,
                              textStyle: TextStyle(fontSize: font)),
                          onPressed: null,
                          child: Text("Inativo"),
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
