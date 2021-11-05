import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sit_eat_web/app/controller/tables_controller.dart';
import 'package:sit_eat_web/app/data/model/table_model.dart';

class ListData extends StatelessWidget {
  final TableModel table;
  ListData({required this.table});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Posição"),
              Text("Nome"),
              Text("horário da solicitação"),
              Text("Quantidade de pessoas na mesa"),
              Text("Telefone"),
            ],
          ),
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("01"),
              Text("02"),
              Text("03"),
              Text("04"),
              Text("05"),
            ],
          ),
        ),
      ],
    );

    // Wrap(
    //   children: [
    //     Row(
    //       mainAxisAlignment: MainAxisAlignment.spaceAround,
    //       children: [
    //         // SizedBox(width: 130.0),
    //         Padding(
    //           padding: const EdgeInsets.all(8.0),
    //           child: Column(
    //             children: [
    //               Container(
    //                 color: Colors.red,
    //                 width: 40,
    //                 child: Text(
    //                   "100",
    //                   style: TextStyle(fontWeight: FontWeight.bold),
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ),
    //         // SizedBox(width: 150.0),
    //         Padding(
    //           padding: const EdgeInsets.all(8.0),
    //           child: Column(
    //             children: [
    //               Container(
    //                 color: Colors.blue,
    //                 width: 350,
    //                 child: Text(
    //                   "Rafael Rodrigues Vitor",
    //                   style: TextStyle(fontWeight: FontWeight.bold),
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ),
    //         // SizedBox(width: 105.0),
    //         Padding(
    //           padding: const EdgeInsets.all(8.0),
    //           child: Column(
    //             children: [
    //               Container(
    //                 color: Colors.green,
    //                 width: 60,
    //                 child: Text(
    //                   "10:20",
    //                   style: TextStyle(fontWeight: FontWeight.bold),
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ),
    //         // SizedBox(width: 450.0),
    //         Padding(
    //           padding: const EdgeInsets.all(8.0),
    //           child: Column(
    //             children: [
    //               Container(
    //                 color: Colors.yellow,
    //                 width: 20,
    //                 child: Text(
    //                   "5",
    //                   style: TextStyle(fontWeight: FontWeight.bold),
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ),
    //         // SizedBox(width: 330.0),
    //         Padding(
    //           padding: const EdgeInsets.all(8.0),
    //           child: Column(
    //             children: [
    //               Container(
    //                 color: Colors.pink,
    //                 width: 170,
    //                 child: Text(
    //                   "(19) 99214-3881",
    //                   style: TextStyle(fontWeight: FontWeight.bold),
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ),
    // Icon(Icons.label),
    // Text("Mesa ${table.number}"),
    // Text("Quantidade: ${table.capacity} pessoas"),
    // Text("Mesa ${table.number}"),
    // Text("Quantidade: ${table.capacity} pessoas"),
    // Text("Quantidade: ${table.capacity} pessoas"),
    // ],
    // ),
    // ],
    // );
  }
}
