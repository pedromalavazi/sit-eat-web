import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sit_eat_web/app/data/model/dashboard_model.dart';
import 'package:sit_eat_web/app/data/model/enum/reservation_status_enum.dart';
import 'package:sit_eat_web/pages/dashboard/table_order_item_card.dart';

class TableOrderCard extends StatelessWidget {
  final DashboardModel table;
  TableOrderCard({required this.table});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        width: 170,
        //height: 170,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 15.0,
          color: table.busy ?? false
              ? (table.status == ReservationStatus.FINALIZADO
                  ? Colors.yellow
                  : Colors.red)
              : Colors.green,
          child: InkWell(
            borderRadius: BorderRadius.circular(15),
            onTap: () {
              Get.dialog(
                AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  title: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Mesa ${table.number}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: "Source Code Pro"),
                      ),
                    ),
                  ),
                  content: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 600,
                            height: 450,
                            child: Column(
                              children: [
                                TableOrderItemCard(
                                  reservationId: table.reservationId!,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            height: 35,
                            child: ElevatedButton(
                              onPressed: () async {
                                await Get.dialog(
                                  AlertDialog(
                                    backgroundColor: Colors.red,
                                    content: Container(
                                      width: 350,
                                      height: 210,
                                      child: Card(
                                        elevation: 15.0,
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Container(
                                                    margin: EdgeInsets.fromLTRB(
                                                        25, 25, 0, 0),
                                                    width: 300.0,
                                                    height: 80.0,
                                                    child: Text(
                                                      "Você fez o recebimento da conta do cliente?",
                                                      style: TextStyle(
                                                        fontSize: 20,
                                                      ),
                                                    )),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.fromLTRB(
                                                      25, 20, 0, 0),
                                                  width: 150.0,
                                                  height: 40.0,
                                                  child: ElevatedButton(
                                                    onPressed: () {
                                                      Get.back();
                                                      Get.back();
                                                    },
                                                    child: Text(
                                                      "Confirmar",
                                                      style: TextStyle(
                                                          fontSize: 15.0),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.fromLTRB(
                                                      25, 20, 0, 0),
                                                  width: 125.0,
                                                  height: 40.0,
                                                  child: TextButton(
                                                    onPressed: () => Get.back(),
                                                    child: Text(
                                                      "Cancelar",
                                                      style: TextStyle(
                                                          fontSize: 15.0),
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
                                );
                              },
                              child: Row(
                                children: [
                                  Text(
                                    "Pagamento recebido",
                                    style: TextStyle(fontSize: 16.0),
                                  ),
                                  Icon(
                                    Icons.check_circle_outline_rounded,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith(
                                  (states) => Colors.green,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "${table.number}",
                          style: TextStyle(fontSize: 50.0, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 16, left: 16, right: 16),
                        child: Text(
                          "${table.userName}",
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 16, left: 12, right: 20, top: 10),
                        child: Icon(
                          Icons.group,
                          color: Colors.lightGreen,
                        ),
                      ),
                      Text(
                        "${table.occupationQty}",
                        style:
                            TextStyle(fontSize: 20.0, color: Colors.lightGreen),
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
  }
}
