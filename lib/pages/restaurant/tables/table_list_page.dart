import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sit_eat_web/pages/restaurant/tables/widgets/mesas_card.dart';
import 'package:sit_eat_web/utils/menu.dart';
import 'package:sit_eat_web/utils/web_utils.dart';

class RegisterTableController extends GetxController {
  //RxBool result = false.obs;
  final TextEditingController tableNumberController = TextEditingController();
  final TextEditingController capacityController = TextEditingController();

  register() {
    int qtdP = int.parse(capacityController.text);
    int numM = int.parse(tableNumberController.text);

    print(qtdP);
    print(numM);

    Get.back(result: {qtdP, numM});
  }
}

class TableListPage extends GetView<RegisterTableController> {
  final RegisterTableController _registerTableController =
      Get.put(RegisterTableController());
  final _formKey = GlobalKey<FormState>();

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
              //return _registerTableController.capacityController.value = await Get.dialog(
              await Get.dialog(
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
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Container(
                          child: TextFormField(
                            controller:
                                _registerTableController.tableNumberController,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp('[0-9]')),
                            ],
                            autofocus: true,
                            textAlignVertical: TextAlignVertical.top,
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
                            controller:
                                _registerTableController.capacityController,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp('[0-9]')),
                            ],
                            textAlignVertical: TextAlignVertical.top,
                            style: TextStyle(fontFamily: "Source Code Pro"),
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              labelText: "Quantidade de Pessoas:",
                              labelStyle: TextStyle(
                                color: Colors.black,
                                fontFamily: "Source Code Pro",
                              ),
                              prefixIcon: Icon(
                                Icons.people_alt,
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
                      onPressed: () => Get.back(),
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
                    TextButton(
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
                      onPressed: () => {_registerTableController.register()},
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
              itemCount: 50, //Quantidade de Mesas
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
                    return TableCard(
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
