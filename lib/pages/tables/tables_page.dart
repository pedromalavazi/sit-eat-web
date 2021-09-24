import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sit_eat_web/app/controller/tables_controller.dart';
import 'package:sit_eat_web/pages/tables/widgets/table_card.dart';
import 'package:sit_eat_web/utils/menu.dart';

class TablesPage extends GetView<TablesController> {
  final TablesController _tableController = Get.find<TablesController>();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Menu(
      title: 'Mesas',
      body: _body(context),
    );
  }

  _body(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Wrap(
          children: [
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: TextButton.icon(
                          icon: Icon(
                            Icons.add,
                            size: 20,
                          ),
                          label: Text(
                            'Mesa',
                            style: TextStyle(fontSize: 20.0),
                          ),
                          style: TextButton.styleFrom(
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
                            await Get.dialog(
                              AlertDialog(
                                backgroundColor: Colors.red,
                                content: Form(
                                  key: _formKey,
                                  child: Container(
                                    width: 350,
                                    height: 210,
                                    child: Card(
                                      elevation: 15.0,
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                margin: EdgeInsets.fromLTRB(25, 25, 0, 0),
                                                width: 300.0,
                                                height: 40.0,
                                                child: TextFormField(
                                                  controller: _tableController.tableNumberController,
                                                  inputFormatters: [
                                                    FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                                                  ],
                                                  cursorColor: Colors.black,
                                                  obscureText: false,
                                                  autofocus: true,
                                                  keyboardType: TextInputType.number,
                                                  decoration: InputDecoration(
                                                    border: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    prefixIcon: Icon(
                                                      Icons.analytics,
                                                    ),
                                                    labelText: "Número da mesa",
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                margin: EdgeInsets.fromLTRB(25, 25, 0, 0),
                                                width: 300.0,
                                                height: 40.0,
                                                child: TextFormField(
                                                  controller: _tableController.capacityController,
                                                  inputFormatters: [
                                                    FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                                                  ],
                                                  cursorColor: Colors.black,
                                                  obscureText: false,
                                                  autofocus: true,
                                                  keyboardType: TextInputType.number,
                                                  decoration: InputDecoration(
                                                    border: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    prefixIcon: Icon(Icons.group),
                                                    labelText: "Quantidade de pessoas",
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                margin: EdgeInsets.fromLTRB(25, 20, 0, 0),
                                                width: 150.0,
                                                height: 40.0,
                                                child: ElevatedButton(
                                                  onPressed: () {
                                                    if (_formKey.currentState!.validate()) {
                                                      _tableController.register();
                                                    }
                                                  },
                                                  child: Text(
                                                    "Cadastrar mesa",
                                                    style: TextStyle(fontSize: 15.0),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.fromLTRB(25, 20, 0, 0),
                                                width: 125.0,
                                                height: 40.0,
                                                child: TextButton(
                                                  onPressed: () => Get.back(),
                                                  child: Text(
                                                    "Cancelar",
                                                    style: TextStyle(fontSize: 15.0),
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
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Obx(
                  () => Wrap(
                    children: List.generate(
                      _tableController.tables.length,
                      (index) => TableCard(table: _tableController.tables[index]),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
