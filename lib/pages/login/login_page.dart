import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sit_eat_web/app/controller/login_controller.dart';
import 'package:sit_eat_web/app/routes/app_pages.dart';

class LoginPage extends GetView<LoginController> {
  final LoginController _loginController = Get.find<LoginController>();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: Wrap(
          children: [
            Container(
              width: 400.0,
              height: 420.0,
              child: Card(
                elevation: 15.0,
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(45, 25, 0, 30),
                            child: SizedBox(
                              width: 50,
                              height: 50,
                              child: Image.asset("assets/logo-only.png"),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(10, 5, 0, 0),
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
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(45, 20, 0, 0),
                            width: 300.0,
                            height: 40.0,
                            child: TextFormField(
                              controller: _loginController.emailTextController,
                              obscureText: false,
                              autofocus: true,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                // prefixIcon: Icon(Icons.ac_unit),
                                prefixIcon: Icon(Icons.person),
                                labelText: 'Usuário',
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(45, 23, 0, 0),
                            width: 300.0,
                            height: 40.0,
                            child: TextField(
                              controller:
                                  _loginController.passwordTextController,
                              obscureText: true,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(Icons.password),
                                labelText: 'Senha',
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(32, 0, 0, 0),
                            child: Obx(
                              () => Switch(
                                value: _loginController.stayLogged.value,
                                onChanged: 0 == 1
                                    ? null
                                    : (bool value) {
                                        _loginController.stayLogged.value =
                                            value;
                                      },
                              ),
                            ),
                          ),
                          Text(
                            'Mantenha-me conectado',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(40, 5, 0, 0),
                            width: 135.0,
                            height: 20.0,
                            child: TextButton(
                              onPressed: () {
                                Get.toNamed(Routes.RESTAURANT_REGISTER);
                              },
                              child: Text(
                                "Esqueceu a senha?",
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(45, 25, 0, 0),
                            width: 300.0,
                            height: 40.0,
                            child: ElevatedButton(
                              onPressed: () {
                                _loginController.loginMocked();
                                // _loginController.login();
                              },
                              child: Text(
                                "Login",
                                style: TextStyle(fontSize: 20.0),
                              ),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith(
                                        (states) => Colors.red),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(150, 10, 0, 0),
                            width: 90.0,
                            height: 20.0,
                            child: TextButton(
                              onPressed: () {
                                Get.toNamed(Routes.RESTAURANT_REGISTER);
                              },
                              child: Text(
                                "Cadastrar-se",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15.0,
                                ),
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
    );
  }
}
