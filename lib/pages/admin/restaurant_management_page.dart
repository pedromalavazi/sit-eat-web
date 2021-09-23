import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sit_eat_web/app/controller/products_controller.dart';
import 'package:sit_eat_web/app/controller/restaurant_manage_controller.dart';
import 'package:sit_eat_web/app/routes/app_pages.dart';
import 'package:sit_eat_web/pages/admin/widgets/restaurant_card.dart';
import 'package:sit_eat_web/utils/menu.dart';
import 'package:sit_eat_web/utils/web_utils.dart';

class RestaurantManagementPage extends GetView<RestaurantManagementController> {
  // final RestaurantManagementController _restaurantManagementController = Get.find<RestaurantManagementController>();

  @override
  Widget build(BuildContext context) {
    return Menu(
      title: "Restaurant Management",
      body: _body(),
    );
  }

  _body() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                // color: Colors.red,
                width: 500,
                height: 50,
                child: Card(
                  elevation: 15.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );

    // SingleChildScrollView(
    //   child: Wrap(
    //     children: [
    //       Column(
    //         children: [
    //           Container(
    //             width: 500,
    //             decoration: BoxDecoration(
    //               borderRadius: BorderRadius.circular(25),
    //               color: Colors.white,
    //               boxShadow: [
    //                 BoxShadow(
    //                   color: Colors.grey.withOpacity(0.3),
    //                   spreadRadius: 5,
    //                   blurRadius: 7,
    //                   offset: Offset(0, 3), // position
    //                 ),
    //               ],
    //             ),
    //             child: TextField(
    //               controller: _restaurantManagementController.restaurantNameTextController,
    //               keyboardType: TextInputType.text,
    //               style: TextStyle(
    //                 fontSize: 20,
    //                 color: Colors.black,
    //               ),
    //               decoration: InputDecoration(
    //                 fillColor: Colors.white,
    //                 contentPadding: EdgeInsets.all(15),
    //                 prefixIcon: Padding(
    //                   padding: EdgeInsets.only(left: 15, right: 15),
    //                   child: CircleAvatar(
    //                     backgroundColor: Colors.red,
    //                     child: Icon(
    //                       Icons.search,
    //                       color: Colors.white,
    //                     ),
    //                   ),
    //                 ),
    //                 hintText: "Pesquisar restaurantes",
    //                 border: InputBorder.none,
    //               ),
    //             ),
    //           ),
    //           SingleChildScrollView(
    //             child: Obx(
    //               () => Wrap(
    //                 children: List.generate(
    //                   _restaurantManagementController.listRestaurants.length,
    //                   (index) => RestaurantCard(
    //                     restaurant: _restaurantManagementController.listRestaurants[index],
    //                   ),
    //                 ),
    //               ),

    //               // Expanded(
    //               //   child: GridView.builder(
    //               //     itemCount: _restaurantManagementController.listRestaurants.length, //Quantidade de Restaurante para aprovar
    //               //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //               //       childAspectRatio: 7.0,
    //               //       crossAxisCount: 1,
    //               //       crossAxisSpacing: 20,
    //               //     ),
    //               //     itemBuilder: (context, index) {
    //               //       return LayoutBuilder(
    //               //         builder: (context, constraints) {
    //               //           double font = fontSize(constraints.maxHeight * 0.1, min: 10, max: 20);

    //               //           return InkWell(
    //               //             onTap: () {
    //               //               Get.toNamed(Routes.RESTAURANT_APPROVAL, arguments: _restaurantManagementController.listRestaurants[index].id);
    //               //             },
    //               //             child: Obx(
    //               //               () => Card(
    //               //                 child: Row(
    //               //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //               //                   children: <Widget>[
    //               //                     Row(
    //               //                       children: [
    //               //                         ConstrainedBox(
    //               //                           constraints: BoxConstraints(maxWidth: 200),
    //               //                           child: Container(
    //               //                             margin: EdgeInsets.only(right: 50, left: 50),
    //               //                             width: 180,
    //               //                             height: 150,
    //               //                             child: Image.network(_restaurantManagementController.listRestaurants[index].image ?? ""),
    //               //                             // decoration: BoxDecoration(
    //               //                             //   shape: BoxShape.circle,
    //               //                             //   // Logo image restaurante
    //               //                             //   image: DecorationImage(
    //               //                             //     image: NetworkImage(
    //               //                             //       _restaurantManagementController
    //               //                             //               .listRestaurants[index]
    //               //                             //               .image ??
    //               //                             //           'gs://sit-eat-84d56.appspot.com/restaurants/madero.png',
    //               //                             //     ),
    //               //                             //     fit: BoxFit.fill,
    //               //                             //   ),
    //               //                             // ),
    //               //                           ),
    //               //                         ),
    //               //                         Column(
    //               //                           mainAxisAlignment: MainAxisAlignment.center,
    //               //                           crossAxisAlignment: CrossAxisAlignment.start,
    //               //                           children: <Widget>[
    //               //                             Text(
    //               //                               _restaurantManagementController.listRestaurants[index].name ?? "Não tem restaurante", //Nome do Restaurante
    //               //                               overflow: TextOverflow.ellipsis,
    //               //                               style: TextStyle(fontSize: font, fontWeight: FontWeight.bold),
    //               //                             ),
    //               //                             Row(
    //               //                               children: [
    //               //                                 Text(
    //               //                                   "Endereço: ", //Dias da semana
    //               //                                   overflow: TextOverflow.ellipsis,
    //               //                                   style: TextStyle(fontSize: font),
    //               //                                 ),
    //               //                                 Text(
    //               //                                   _restaurantManagementController.listRestaurants[index].address ?? "", //Dias da semana
    //               //                                   overflow: TextOverflow.ellipsis,
    //               //                                   style: TextStyle(fontSize: font),
    //               //                                 ),
    //               //                               ],
    //               //                             ),
    //               //                           ],
    //               //                         ),
    //               //                       ],
    //               //                     ),
    //               //                     Row(
    //               //                       children: [
    //               //                         Column(
    //               //                           mainAxisAlignment: MainAxisAlignment.center,
    //               //                           //Checkbox de Validação
    //               //                           children: <Widget>[
    //               //                             (_restaurantManagementController.listRestaurants[index].active ?? false)
    //               //                                 ? TextButton(
    //               //                                     style: TextButton.styleFrom(
    //               //                                         backgroundColor: Colors.green,
    //               //                                         elevation: 15,
    //               //                                         shadowColor: Colors.green,
    //               //                                         padding: EdgeInsets.all(16),
    //               //                                         primary: Colors.white,
    //               //                                         textStyle: TextStyle(fontSize: font)),
    //               //                                     onPressed: () {},
    //               //                                     child: Text("Ativo"),
    //               //                                   )
    //               //                                 : TextButton(
    //               //                                     style: TextButton.styleFrom(
    //               //                                         backgroundColor: Colors.red,
    //               //                                         elevation: 15,
    //               //                                         shadowColor: Colors.red,
    //               //                                         padding: EdgeInsets.all(16),
    //               //                                         primary: Colors.white,
    //               //                                         textStyle: TextStyle(fontSize: font)),
    //               //                                     onPressed: () {},
    //               //                                     child: Text("Inativo"),
    //               //                                   )
    //               //                           ],
    //               //                         ),
    //               //                         SizedBox(width: 200),
    //               //                       ],
    //               //                     ),
    //               //                   ],
    //               //                 ),
    //               //               ),
    //               //             ),
    //               //           );
    //               //         },
    //               //       );
    //               //     },
    //               //   ),
    //               // ),
    //             ),
    //           ),
    //         ],
    //       ),
    //     ],
    //   ),
    // );
  }
}
