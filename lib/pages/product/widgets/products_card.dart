import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sit_eat_web/app/controller/products_controller.dart';
import 'package:sit_eat_web/app/data/model/product_model.dart';

class ProductCard extends StatelessWidget {
  //final ProductsController _productsController = Get.find<ProductsController>();
  //final ProductModel product;

  final String name;
  final String description;
  final double price;
  final String measure;

  ProductCard({
    this.name = 'Big Mac',
    this.description =
        'Dois hambúrgueres, alface, queijo e molho especial, cebola e picles num pão com gergelim.',
    this.price = 23.40,
    this.measure = '250g',
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.black),
        borderRadius: BorderRadius.circular(10),
      ),
      leading: Icon(Icons.lunch_dining),
      title: RichText(
        text: TextSpan(
          text: name,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: "Soucer Code Pro",
          ),
          children: <TextSpan>[
            TextSpan(
              text: ' $measure',
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontFamily: "Soucer Code Pro",
                fontStyle: FontStyle.italic,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
      subtitle: Text(
        description,
        style: TextStyle(
          fontSize: 15,
          fontFamily: "Soucer Code Pro",
          color: Colors.black87,
        ),
      ),
      trailing: Text(
        'R\$ ' + price.toStringAsFixed(2),
        style: TextStyle(
            fontSize: 17,
            fontFamily: "Soucer Code Pro",
            color: Colors.black,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
