import 'package:flutter/material.dart';
import 'package:sit_eat_web/pages/admin/widgets/log_card.dart';
import 'package:sit_eat_web/utils/menu.dart';
import 'package:intl/intl.dart';

class LogsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Menu(
      title: 'Logs',
      body: _body(context),
    );
  }

  _body(BuildContext context) {
    DateTime now = DateTime.now();
    String date = DateFormat('yyyy-MM-dd – kk:mm').format(now);
    String tipo = 'INSERT';
    String user = 'patrik.food@gmail.com';
    String description =
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum";

    return Container(
      child: ListView.builder(
        itemCount: 15,
        itemBuilder: (BuildContext context, int index) {
          return LogCard(
              date: date, type: tipo, user: user, description: description);
        },
      ),
    );
  }
}
