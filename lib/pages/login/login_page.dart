import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sit_eat_web/app/controller/login_controller.dart';
import 'package:sit_eat_web/app/routes/app_pages.dart';

class LoginPage extends GetView<LoginController> {
  final LoginController _loginController = Get.put(LoginController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 400.0,
          height: 370.0,
          child: Card(
            elevation: 15.0,
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
                    child: Text(
                      "Sit & Eat",
                      style: TextStyle(
                        fontSize: 23.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                    width: 300.0,
                    height: 40.0,
                    child: TextField(
                      controller: _loginController.emailTextController,
                      obscureText: false,
                      autofocus: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Usuário',
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 23, 0, 0),
                    width: 300.0,
                    height: 40.0,
                    child: TextField(
                      controller: _loginController.passwordTextController,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Senha',
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                    width: 300.0,
                    height: 40.0,
                    child: ElevatedButton(
                      onPressed: () {
                        _loginController.login();
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(fontSize: 20.0),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith(
                            (states) => Colors.red),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    width: 300.0,
                    height: 40.0,
                    child: TextButton(
                      onPressed: () {
                        Get.toNamed(Routes.REGISTER_RESTAURANT);
                      },
                      child: Text(
                        "Cadastrar-se",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
