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
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        width: 450,
        height: 150,
        child: Card(
          color: Colors.lightBlue[300],
          elevation: 15.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ListTile(
                title: Text(
                  name,
                  style: TextStyle(fontSize: 20.0),
                ),
                subtitle: Text(
                  description,
                  style: TextStyle(fontSize: 16),
                ),
                leading: Icon(
                  Icons.restaurant_menu,
                  color: Colors.black,
                ),
                trailing: Text("R\$" + price.toStringAsFixed(2)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
