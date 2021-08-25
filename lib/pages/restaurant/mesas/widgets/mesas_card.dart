import 'package:flutter/material.dart';

class MesasCard extends StatelessWidget {
  bool ocupado = false;

  @override
  Widget build(BuildContext context) {
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
          trailing: ocupado
              ? Text(
                  'Ocupado',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                  ),
                )
              : Text(
                  'Livre',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
          title: Text(
            "Mesa ${1 + 1}",
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            "Quantidade: 4 pessoas",
            style: TextStyle(
              fontSize: 20 / 2,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
