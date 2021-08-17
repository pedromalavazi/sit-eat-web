import 'package:flutter/material.dart';
import 'package:sit_eat_web/pages/admin/web/web_utils.dart';

class AprovarPage extends StatefulWidget {
  @override
  AprovarPage_State createState() => AprovarPage_State();
}

class AprovarPage_State extends State<AprovarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  _body() {
    return GridView.builder(
      itemCount: 10, //Quantidade de Restaurante para aprovar
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 4.0,
        crossAxisCount: 1,
        crossAxisSpacing: 20,
      ),
      itemBuilder: (context, index) {
        return LayoutBuilder(
          builder: (context, constraints) {
            double font =
                fontSize(constraints.maxHeight * 0.1, min: 10, max: 20);

            return Card(
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
                        style: TextStyle(
                            fontSize: font, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Horario: 16h - 22h", //Horario de funcionamento
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: font),
                      ),
                      Text(
                        "Dias da semana: Seg - Sex", //Dias da semana
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: font),
                      ),
                    ],
                  ),
                  SizedBox(width: 130),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    //Checkbox de Validação
                    children: <Widget>[
                      TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.green,
                            elevation: 15,
                            shadowColor: Colors.green,
                            padding: EdgeInsets.all(16),
                            primary: Colors.white,
                            textStyle: TextStyle(fontSize: font)),
                        onPressed: () {},
                        child: Text("Ativo"),
                      ),
                      SizedBox(height: 15),
                      TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.red,
                            elevation: 15,
                            shadowColor: Colors.red,
                            padding: EdgeInsets.all(16),
                            primary: Colors.white,
                            textStyle: TextStyle(fontSize: font)),
                        onPressed: null,
                        child: Text("Inativo"),
                      )
                    ],
                  )
                ],
              ),
            );
          },
        );
      },
    );
  }
}
