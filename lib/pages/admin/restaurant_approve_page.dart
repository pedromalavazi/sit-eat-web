import 'package:flutter/material.dart';
import 'package:sit_eat_web/utils/menu.dart';
import 'package:sit_eat_web/utils/web_utils.dart';

class RestaurantApprovePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Menu(
      title: "Restaurant Approval",
      body: _body(),
    );
  }

  _body() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Container(
            child: Image.network(
                "https://4cpatiobatel.crmall.com/Api/store/image/Y2Uvc09LRXVZZzExZElBUUlXZEZiUT09"), //Logo do Restaurante
            padding: EdgeInsets.all(15),
          ),
        ),
        SizedBox(
          width: 28,
        ),
        Expanded(
          flex: 2,
          child: Card(
            child: Container(
              padding: EdgeInsets.all(16),
              child: Form(
                child: ListView(
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Tipo",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 18,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        // Radio<Validar>(
                        //   value: Validar.desabilitado,
                        //   activeColor: Colors.green,
                        //   groupValue: _val,
                        //   onChanged: (Validar? value) {

                        //   },
                        // ),
                        Text(
                          "Ativo",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                        ),
                        // Radio<Validar>(
                        //   value: Validar.ativo,
                        //   groupValue: _val,
                        //   onChanged: (Validar? value) {

                        //   },
                        // ),
                        Text(
                          "Desabilitado",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    textField('Nome', 'Madero'),
                    textField(
                      'Endereço',
                      'Rua Antonio Marques Serra, 545',
                    ),
                    textField('Abertura', '19:00'),
                    textField('Fechamento', '22:00'),
                    textField('Capacidade Maxima', '20'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        TextButton(
                          style: TextButton.styleFrom(
                              side: BorderSide(color: Colors.black),
                              backgroundColor: Colors.red,
                              elevation: 15,
                              shadowColor: Colors.red,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 50, vertical: 25),
                              primary: Colors.white,
                              textStyle: TextStyle(fontSize: 15)),
                          onPressed: () {},
                          child: Text("Salvar"),
                        ),
                        SizedBox(width: 15),
                        TextButton(
                          style: TextButton.styleFrom(
                              side: BorderSide(color: Colors.black),
                              backgroundColor: Colors.white,
                              elevation: 15,
                              shadowColor: Colors.black,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 50, vertical: 25),
                              primary: Colors.black,
                              textStyle: TextStyle(fontSize: 15)),
                          onPressed: () {},
                          child: Text("Cancelar"),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Padding textField(String info, String label) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2, vertical: 15),
      child: TextField(
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)),
            ),
            enabled: false,
            labelText: info,
            labelStyle: TextStyle(
              fontSize: fontSize(25),
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            hintText: label,
            hintStyle: TextStyle(
              height: 1.5,
              color: Colors.black54,
            ),
            floatingLabelBehavior: FloatingLabelBehavior.always),
      ),
    );
  }
}