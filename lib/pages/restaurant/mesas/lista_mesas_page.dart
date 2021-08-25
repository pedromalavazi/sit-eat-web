import 'package:flutter/material.dart';
import 'package:sit_eat_web/utils/menu.dart';
import 'package:sit_eat_web/utils/web_utils.dart';

class ListaMesasPage extends StatelessWidget {
  bool ocupado = false;

  @override
  Widget build(BuildContext context) {
    return Menu(
      title: 'Mesas',
      body: _body(),
    );
  }

  _body() {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 15),
          child: TextButton.icon(
            icon: Icon(
              Icons.add,
              size: 17,
            ),
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(5),
              ),
              backgroundColor: Colors.red,
              elevation: 2,
              padding: EdgeInsets.all(20),
              primary: Colors.white,
              textStyle: TextStyle(
                fontSize: 17,
              ),
            ),
            onPressed: () {},
            label: Text(
              'Adicionar Mesa',
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 20,
            itemBuilder: (BuildContext context, int index) {
              // Card Mesas
              return Card(
                color: Colors.white,
                elevation: 2,
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(2),
                ),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: Icon(Icons.table_view),
                    title: Text(
                      "Mesa ${index + 1}",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      "Quantidade: 4 pessoas",
                      style: TextStyle(fontSize: 15, color: Colors.black87),
                    ),
                    trailing: ocupado
                        ? Text(
                            'Ocupado',
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.red,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        : Text(
                            'Livre',
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
