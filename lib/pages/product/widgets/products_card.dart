import 'package:flutter/material.dart';
import 'package:sit_eat_web/app/data/model/product_model.dart';

class ProductCard extends StatelessWidget {
  // final ProductsController _productController = Get.find<ProductsController>();
  final ProductModel product;

  ProductCard({required this.product});

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
                  product.name ?? "",
                  style: TextStyle(fontSize: 20.0),
                ),
                subtitle: Text(
                  product.description ?? "",
                  style: TextStyle(fontSize: 16),
                ),
                leading: Image.network(product.image ?? ""),
                trailing: Text(
                  "R\$" +
                      (product.price != null
                          ? product.price!.toStringAsFixed(2)
                          : "0"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
