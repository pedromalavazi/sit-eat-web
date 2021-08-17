import 'package:flutter/material.dart';

class RestauranteFormPage extends StatefulWidget {
  @override
  _RestauranteFormPage createState() => _RestauranteFormPage();
}

enum Validar { ativo, desabilitado }

class _RestauranteFormPage extends State<RestauranteFormPage> {
  final GlobalKey<FormState> _formKey =
      GlobalKey<FormState>(debugLabel: "restaurante_form");

  Validar? _val = Validar.ativo;
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
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
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
                key: this._formKey,
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
                          "Ativo",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
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
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                    TextField(),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
