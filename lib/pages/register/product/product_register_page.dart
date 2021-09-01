import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sit_eat_web/app/controller/product_register_controller.dart';
import 'package:sit_eat_web/app/routes/app_pages.dart';

class ProductRegisterPage extends GetView<ProductRegisterController> {
  final ProductRegisterController _productRegisterController =
      Get.put(ProductRegisterController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro de produtos"),
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.black87,
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountEmail: Text("Email"),
                accountName: Text("Nome da pessoa"),
                currentAccountPicture: CircleAvatar(
                  child: Text("Empresa"),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                title: Text(
                  "Minha conta",
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Get.toNamed(Routes.RESTAURANT_PROFILE);
                  // Navigator.pop(context);
                  //Navegar para outra página
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.shopping_basket,
                  color: Colors.white,
                ),
                title: Text(
                  "Cadastrar produto",
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Get.toNamed(Routes.PRODUCT_REGISTER);
                  //Navegar para outra página
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.favorite,
                  color: Colors.white,
                ),
                title: Text(
                  "Favoritos",
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.pop(context);
                  //Navegar para outra página
                },
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Form(
                key: _formKey,
                child: Container(
                  width: 500.0,
                  height: 320.0,
                  child: Card(
                    elevation: 15.0,
                    child: ListView(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(25, 25, 0, 0),
                              width: 265.0,
                              height: 40.0,
                              child: TextFormField(
                                validator: (String? value) {
                                  if (value == null || value.isEmpty) {
                                    return "Preencha este campo";
                                  }
                                  return null;
                                },
                                controller: _productRegisterController
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
                                  prefixIcon: Icon(Icons.restaurant),
                                  labelText: "Nome do produto",
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(25, 25, 0, 0),
                              width: 150.0,
                              height: 40.0,
                              child: TextFormField(
                                controller: _productRegisterController
                                    .priceTextController,
                                cursorColor: Colors.black,
                                obscureText: false,
                                autofocus: true,
                                keyboardType: TextInputType.number,
                                // maxLength: 3,
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      RegExp('[0-9]')),
                                ],
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    ),
                                  ),
                                  prefixIcon: Icon(Icons.attach_money),
                                  labelText: "Preço",
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(25, 25, 0, 0),
                              width: 440.0,
                              height: 40.0,
                              child: TextFormField(
                                controller: _productRegisterController
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
                              margin: EdgeInsets.fromLTRB(25, 25, 0, 0),
                              width: 440.0,
                              height: 90.0,
                              child: TextFormField(
                                maxLines: 150,
                                maxLength: 500,
                                controller: _productRegisterController
                                    .descriptionTextController,
                                cursorColor: Colors.black,
                                obscureText: false,
                                autofocus: true,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  prefixIcon: Icon(Icons.description),
                                  labelText: "Descrição do produto",
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(25, 10, 0, 0),
                              width: 150.0,
                              height: 40.0,
                              child: ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    // Process data.
                                  }
                                },
                                child: Text(
                                  "Cadastrar produto",
                                  style: TextStyle(fontSize: 15.0),
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
            ],
          ),
        ),
      ),
    );
  }
}
