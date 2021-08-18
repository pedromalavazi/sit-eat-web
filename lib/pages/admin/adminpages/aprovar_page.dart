import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sit_eat_web/pages/admin/adminpages/restaurantes/restaurante_form_page.dart';
import 'package:sit_eat_web/pages/admin/web/web_utils.dart';
import 'package:sit_eat_web/utils/app_model.dart';

class AprovarPage extends StatefulWidget {
  @override
  AprovarPage_State createState() => AprovarPage_State();
}

class AprovarPage_State extends State<AprovarPage> {
  Validar? _val = Validar.desabilitado;
  final tNome = TextEditingController();
  final tDesc = TextEditingController();

  void initState() {
    super.initState();

    tNome.text = 'Madero';
    tDesc.text = '19h - 22h';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  _body() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Radio<Validar>(
                          value: Validar.desabilitado,
                          activeColor: Colors.green,
                          groupValue: _val,
                          onChanged: (Validar? value) {
                            setState(
                              () {
                                _val = value;
                              },
                            );
                          },
                        ),
                        Text(
                          "Habilitado",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                        Radio<Validar>(
                          value: Validar.ativo,
                          groupValue: _val,
                          onChanged: (Validar? value) {
                            setState(
                              () {
                                _val = value;
                              },
                            );
                          },
                        ),
                        Text(
                          "Desabilitado",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
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
                    textField('Nome', 'Madero'), //field Nome
                    textField('Endereço',
                        'Rua Antonio Marques Serra, 545'), //field Endereço
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          width: 300,
                          child: textField('Abertura', '19:00'),
                        ),
                        SizedBox(
                          width: 300,
                          child: textField('Fechamento', '22:00'),
                        ),
                        SizedBox(
                          width: 300,
                          child: textField('Capacidade Maxima', '20'),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 200,
                    ),
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
                          onPressed: () {
                            AppModel app =
                                Provider.of<AppModel>(context, listen: false);
                            app.pop();
                          },
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
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
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
