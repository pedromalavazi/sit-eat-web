import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sit_eat_web/app/data/model/product_model.dart';

class ProductCard extends StatelessWidget {
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(product.image ?? ""),
                  ),
                ),
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 220,
                      child: Text(
                        product.name ?? "",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Flexible(
                      child: SingleChildScrollView(
                        child: Container(
                          width: 230,
                          child: Text(
                            product.description ?? "",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Text(
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
