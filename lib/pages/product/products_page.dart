import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sit_eat_web/app/controller/products_controller.dart';
import 'package:sit_eat_web/utils/menu.dart';

class ProductsPage extends GetView<ProductsController> {
  final ProductsController _productRegisterController =
      Get.put(ProductsController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Menu(
      title: "Produtos",
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextButton.icon(
                      label: Text(
                        'Produto',
                      ),
                      icon: Icon(
                        Icons.add,
                        size: 17,
                      ),
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.red,
                        elevation: 15,
                        shadowColor: Colors.red,
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 20,
                        ),
                        primary: Colors.white,
                        textStyle: TextStyle(
                          fontFamily: "Soucer Code Pro",
                          fontSize: 15,
                        ),
                      ),
                      onPressed: () {
                        Get.dialog(
                          AlertDialog(
                            backgroundColor: Colors.red,
                            content: Form(
                              key: _formKey,
                              child: Container(
                                width: 500.0,
                                height: 320.0,
                                child: Card(
                                  elevation: 15.0,
                                  child: ListView(
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.fromLTRB(
                                                25, 25, 0, 0),
                                            width: 265.0,
                                            height: 40.0,
                                            child: TextFormField(
                                              validator: (String? value) {
                                                if (value == null ||
                                                    value.isEmpty) {
                                                  return "Preencha este campo";
                                                }
                                                return null;
                                              },
                                              controller:
                                                  _productRegisterController
                                                      .nameTextController,
                                              cursorColor: Colors.black,
                                              obscureText: false,
                                              autofocus: true,
                                              decoration: const InputDecoration(
                                                border: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                prefixIcon:
                                                    Icon(Icons.restaurant),
                                                labelText: "Nome do produto",
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.fromLTRB(
                                                25, 25, 0, 0),
                                            width: 150.0,
                                            height: 40.0,
                                            child: TextFormField(
                                              controller:
                                                  _productRegisterController
                                                      .priceTextController,
                                              cursorColor: Colors.black,
                                              obscureText: false,
                                              autofocus: true,
                                              keyboardType:
                                                  TextInputType.number,
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                prefixIcon:
                                                    Icon(Icons.attach_money),
                                                labelText: "Preço",
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.fromLTRB(
                                                25, 25, 0, 0),
                                            width: 440.0,
                                            height: 40.0,
                                            child: TextFormField(
                                              controller:
                                                  _productRegisterController
                                                      .linkImageTextController,
                                              cursorColor: Colors.black,
                                              obscureText: false,
                                              autofocus: true,
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                prefixIcon: Icon(Icons.link),
                                                labelText: "Link da imagem",
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.fromLTRB(
                                                25, 25, 0, 0),
                                            width: 440.0,
                                            height: 90.0,
                                            child: TextFormField(
                                              maxLines: 150,
                                              maxLength: 500,
                                              controller:
                                                  _productRegisterController
                                                      .descriptionTextController,
                                              cursorColor: Colors.black,
                                              obscureText: false,
                                              autofocus: true,
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(),
                                                prefixIcon:
                                                    Icon(Icons.description),
                                                labelText:
                                                    "Descrição do produto",
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.fromLTRB(
                                                25, 10, 0, 0),
                                            width: 150.0,
                                            height: 40.0,
                                            child: ElevatedButton(
                                              onPressed: () {
                                                if (_formKey.currentState!
                                                    .validate()) {
                                                  _productRegisterController
                                                      .register();
                                                }
                                              },
                                              child: Text(
                                                "Cadastrar produto",
                                                style:
                                                    TextStyle(fontSize: 15.0),
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
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
