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

  ProductCard({
    this.name = 'Big Mac',
    this.description =
        'Dois hambúrgueres, alface, queijo e molho especial, cebola e picles num pão com gergelim.',
    this.price = 23.40,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.black),
        borderRadius: BorderRadius.circular(10),
      ),
      leading: Icon(Icons.lunch_dining),
      title: Text(
        name,
        style: TextStyle(fontSize: 20),
      ),
      subtitle: Text(
        description,
        style: TextStyle(fontSize: 15),
      ),
      trailing: Text(
        'R\$ ' + price.toStringAsFixed(2),
        style: TextStyle(fontSize: 17),
      ),
    );
  }
}
