import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sit_eat_web/utils/app_model.dart';

class RestaurantePage extends StatefulWidget {
  @override
  _RestaurantePageState createState() => _RestaurantePageState();
}

class _RestaurantePageState extends State<RestaurantePage> {
  @override
  Widget build(BuildContext context) {
    return _body();
  }

  _body() {
    return Center(
      child: Row(
        children: <Widget>[
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 200),
            child: Container(
              child: Image.network(
                  "https://4cpatiobatel.crmall.com/Api/store/image/Y2Uvc09LRXVZZzExZElBUUlXZEZiUT09"), //Logo do Restaurante
              padding: EdgeInsets.all(15),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Madero", //Nome do Restaurante
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              ElevatedButton(
                child: Text("Voltar"),
                onPressed: () {
                  AppModel app = Provider.of<AppModel>(context, listen: false);
                  app.pop();
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
