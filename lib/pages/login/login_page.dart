import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:sit_eat_web/app/controller/login_controller.dart';
import 'package:sit_eat_web/app/routes/app_pages.dart';

class LoginPage extends GetView<LoginController> {
  final LoginController _loginController = Get.find<LoginController>();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new AssetImage("background-restaurante.jpg"),
            fit: BoxFit.fill,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
          child: Center(
            child: Container(
              width: 400.0,
              height: 370.0,
              child: Card(
                elevation: 30.0,
                child: Form(
                  key: _formKey,
                  child: Container(
                    margin: EdgeInsets.fromLTRB(10, 45, 10, 45),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(10, 0, 10, 15),
                              child: SizedBox(
                                width: 50,
                                height: 50,
                                child: Image.asset("assets/logo-only.png"),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(10, 0, 10, 15),
                              child: Text(
                                "Sit & Eat",
                                style: TextStyle(
                                  fontSize: 23.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: 300.0,
                          height: 42.0,
                          child: TextField(
                            controller: _loginController.emailTextController,
                            obscureText: false,
                            autofocus: true,
                            decoration: InputDecoration(
                              isDense: true,
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.person),
                              labelText: 'Usuário',
                            ),
                          ),
                        ),
                        Container(
                          width: 300.0,
                          height: 42.0,
                          child: TextField(
                            controller: _loginController.passwordTextController,
                            obscureText: true,
                            decoration: InputDecoration(
                              isDense: true,
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.password),
                              labelText: 'Senha',
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 15),
                          child: Column(
                            children: [
                              Container(
                                width: 300.0,
                                height: 40.0,
                                child: RoundedLoadingButton(
                                  child: Text(
                                    "Entrar",
                                    style: TextStyle(fontSize: 20.0),
                                  ),
                                  color: Colors.red,
                                  successColor: Colors.green,
                                  errorColor: Colors.red,
                                  controller:
                                      _loginController.loginButtonController,
                                  onPressed: () => _loginController.login(),
                                  borderRadius: 5,
                                ),
                              ),
                              Container(
                                width: 300.0,
                                height: 40.0,
                                child: TextButton(
                                  onPressed: () {
                                    Get.toNamed(Routes.RESTAURANT_REGISTER);
                                  },
                                  child: Text(
                                    "Cadastrar-se",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
