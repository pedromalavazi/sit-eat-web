import 'package:flutter/material.dart';

class MesasCard extends StatelessWidget {
  final int id;
  final double font;
  MesasCard({required this.id, required this.font});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.black26),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: <Widget>[
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 200),
            child: Icon(Icons.arrow_right),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Mesa ${id + 1}",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: font,
                  fontFamily: "Soucer Code Pro",
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Quantidade: 4 pessoas",
                style: TextStyle(
                  fontSize: font,
                  color: Colors.black87,
                  fontFamily: "Soucer Code Pro",
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
