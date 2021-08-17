import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sit_eat_web/app/controller/login_controller.dart';
import 'package:sit_eat_web/app/routes/app_pages.dart';

class RegisterPage extends GetView<LoginController> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 250, horizontal: 50),
              width: 1000,
              height: 450,
              child: Card(
                elevation: 15.0,
                child: Wrap(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(25, 25, 0, 30),
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: Image.asset("assets/logo-only.png"),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(10, 40, 0, 30),
                      child: Text(
                        "Sit & Eat",
                        style: TextStyle(
                          fontSize: 23.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(25, 0, 0, 10),
                          child: Text(
                            "Preecha os campos abaixo para cadastrar seu restaurante",
                            style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(25, 25, 0, 0),
                          width: 300.0,
                          height: 40.0,
                          child: TextField(
                            // controller: _loginController.emailTextController,
                            cursorColor: Colors.black,
                            obscureText: false,
                            autofocus: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black,
                                ),
                              ),
                              labelText: "Nome do restaurante",
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(25, 25, 0, 0),
                          width: 300.0,
                          height: 40.0,
                          child: TextField(
                            // controller: _loginController.passwordTextController,,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Estado",
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(25, 25, 0, 0),
                          width: 300.0,
                          height: 40.0,
                          child: TextField(
                            // controller: _loginController.passwordTextController,,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Cidade",
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(25, 25, 0, 0),
                          width: 300.0,
                          height: 40.0,
                          child: TextField(
                            // controller: _loginController.emailTextController,
                            cursorColor: Colors.black,
                            obscureText: false,
                            autofocus: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black,
                                ),
                              ),
                              labelText: "Rua",
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(25, 25, 0, 0),
                          width: 300.0,
                          height: 40.0,
                          child: TextField(
                            // controller: _loginController.passwordTextController,,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Horário de abertura",
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(25, 25, 0, 0),
                          width: 300.0,
                          height: 40.0,
                          child: TextField(
                            // controller: _loginController.passwordTextController,,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Horário de fechamento",
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(25, 25, 0, 0),
                          width: 300.0,
                          height: 40.0,
                          child: TextField(
                            // controller: _loginController.emailTextController,
                            cursorColor: Colors.black,
                            obscureText: false,
                            autofocus: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black,
                                ),
                              ),
                              labelText: "Capacidade",
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 15, 15, 0),
                          width: 300.0,
                          height: 40.0,
                          child: ElevatedButton(
                            onPressed: () {
                              // _loginController.login();
                            },
                            child: Text(
                              "Cadastrar",
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
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 10, 15, 0),
                          width: 300.0,
                          height: 40.0,
                          child: TextButton(
                            onPressed: () {
                              Get.toNamed(Routes.LOGIN);
                            },
                            child: Text(
                              "Voltar",
                              style: TextStyle(color: Colors.grey),
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
      ),
    );
  }
}
