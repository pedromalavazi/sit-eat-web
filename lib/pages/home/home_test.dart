import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sit_eat_web/app/controller/home_controller.dart';
import 'package:sit_eat_web/pages/admin/web/header.dart';
import 'package:sit_eat_web/pages/admin/web/menuteste.dart';
import 'package:sit_eat_web/utils/constants.dart';

class HomeTestPage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          _body(),
        ],
      ),
    );
  }

  _body() {
    return Container(
      width: 300,
      height: 300 - headerHeight,
      child: Row(
        children: <Widget>[
          _menu(),
          _page(),
        ],
      ),
    );
  }

  _menu() {
    return Container(
      width: menuWidht,
      color: Colors.grey[300],
      child: TestPage(),
    );
  }

  _page() {
    return Center(
      child: Container(
        width: 400.0,
        height: 370.0,
        child: Card(
          elevation: 15.0,
          child: Form(
            //key: _formKey,
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
                    onPressed: () {},
                    child: Text("Login"),
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
                    onPressed: () {},
                    child: Text(
                      "Cadastra-se",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
