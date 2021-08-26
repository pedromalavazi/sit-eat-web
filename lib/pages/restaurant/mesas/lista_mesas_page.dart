import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sit_eat_web/pages/restaurant/mesas/widgets/mesas_card.dart';
import 'package:sit_eat_web/utils/menu.dart';
import 'package:sit_eat_web/utils/web_utils.dart';

class CadastroM extends GetxController {
  RxBool result = false.obs;
}

class ListaMesasPage extends StatelessWidget {
  final CadastroM cm = Get.put(CadastroM());

  @override
  Widget build(BuildContext context) {
    return Menu(
      title: 'Mesas',
      body: _body(context),
    );
  }

  _body(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          color: Colors.white,
          margin: EdgeInsets.only(top: 15),
          child: TextButton.icon(
            icon: Icon(
              Icons.add,
              size: 17,
            ),
            style: TextButton.styleFrom(
              side: BorderSide(color: Colors.black),
              backgroundColor: Colors.red,
              elevation: 15,
              shadowColor: Colors.red,
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 20,
              ),
              primary: Colors.white,
              textStyle: TextStyle(
                fontFamily: "Soucer Code Pro",
                fontSize: 15,
              ),
            ),
            onPressed: () async {
              //showDialog(context: context, builder: (context) => dialog);
              return cm.result.value = await Get.dialog(
                AlertDialog(
                  title: Text(
                    "Cadastro de Mesa",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Source Code Pro",
                    ),
                  ),
                  content: Form(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Container(
                          child: TextFormField(
                            autofocus: true,
                            textAlignVertical: TextAlignVertical.top,
                            keyboardType: TextInputType.number,
                            maxLength: 2,
                            style: TextStyle(fontFamily: "Source Code Pro"),
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              labelText: "Número da mesa:",
                              labelStyle: TextStyle(
                                color: Colors.black,
                                fontFamily: "Source Code Pro",
                              ),
                              prefixIcon: Icon(
                                Icons.analytics_outlined,
                                color: Colors.black,
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          child: TextFormField(
                            textAlignVertical: TextAlignVertical.top,
                            keyboardType: TextInputType.number,
                            maxLength: 2,
                            style: TextStyle(fontFamily: "Source Code Pro"),
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              labelText: "Quantidade de Pessoas:",
                              labelStyle: TextStyle(
                                color: Colors.black,
                                fontFamily: "Source Code Pro",
                              ),
                              prefixIcon: Icon(
                                Icons.group_add_outlined,
                                color: Colors.black,
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Get.back(result: false),
                      style: TextButton.styleFrom(
                        side: BorderSide(color: Colors.black, width: 1.5),
                        backgroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 15,
                        ),
                        primary: Colors.black,
                        textStyle: TextStyle(
                          fontFamily: "Soucer Code Pro",
                          fontSize: 15,
                        ),
                      ),
                      child: Text(
                        "Cancelar",
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Source Code Pro",
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: TextButton.styleFrom(
                        side: BorderSide(
                          color: Colors.black,
                          width: 1.5,
                        ),
                        backgroundColor: Colors.red,
                        padding: EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 15,
                        ),
                        primary: Colors.white,
                        textStyle: TextStyle(
                          fontFamily: "Soucer Code Pro",
                          fontSize: 15,
                        ),
                      ),
                      onPressed: () => Get.back(result: true),
                      child: Text(
                        "Cadastrar",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Soucer Code Pro",
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
            label: Text(
              'Adicionar Mesa',
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[300],
              shape: BoxShape.rectangle,
              border: Border.all(
                color: Colors.black54,
                width: 2.0,
                style: BorderStyle.solid,
              ),
            ),
            child: GridView.builder(
              //Quantidade de Mesas
              itemCount: 20,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 5.0,
                crossAxisCount: 3,
                crossAxisSpacing: 3,
              ),

              itemBuilder: (BuildContext context, int index) {
                return LayoutBuilder(
                  builder: (context, constraints) {
                    double font =
                        fontSize(constraints.maxHeight * 0.15, min: 9, max: 22);
                    // Card Mesas
                    return MesasCard(
                      id: index,
                      font: font,
                    );
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
