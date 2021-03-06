import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sit_eat_web/app/controller/products_controller.dart';
import 'package:sit_eat_web/app/data/model/product_model.dart';

class ProductCard extends StatelessWidget {
  final ProductsController _productsController = Get.find<ProductsController>();
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
          elevation: 15.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.all(9.0),
                child: Container(
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
                              fontSize: 15,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Text(
                    "R\$" + (product.price != null ? product.price!.toStringAsFixed(2) : "0"),
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Get.dialog(
                        AlertDialog(
                          content: Form(
                            child: Container(
                              width: 280,
                              height: 80,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Deseja realmente excluir este produto?",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 25.0,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                        width: 100,
                                        height: 35,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            _productsController.delete(product.id);
                                            Get.back();
                                          },
                                          child: Text(
                                            "Excluir",
                                            style: TextStyle(fontSize: 18.0),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 100,
                                        height: 35,
                                        child: TextButton(
                                          onPressed: () => Get.back(),
                                          child: Text(
                                            "Cancelar",
                                            style: TextStyle(fontSize: 18.0),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    child: Icon(Icons.delete),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
