import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          "Login",
          style: TextStyle(
            fontFamily: "Source Code Pro",
          ),
        ),
      ),
      body: Center(
        child: Container(
          width: 500.0,
          height: 500.0,
          child: Card(
            elevation: 15.0,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 80, 0, 0),
                  child: Text(
                    "Efetue o login",
                    style:
                        TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
                  width: 300.0,
                  height: 50.0,
                  child: const TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Usuário',
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                  width: 300.0,
                  height: 50.0,
                  child: const TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Senha',
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 70, 0, 0),
                  width: 300.0,
                  height: 50.0,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("Entrar"),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith(
                          (states) => Colors.red),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  width: 300.0,
                  height: 50.0,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Não possui uma conta? Cadastra-se",
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
