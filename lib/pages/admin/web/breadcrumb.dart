import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sit_eat_web/utils/app_model.dart';

class BreadCrumb extends StatefulWidget {
  @override
  _BreadCrumb_State createState() => _BreadCrumb_State();
}

class _BreadCrumb_State extends State<BreadCrumb> {
  @override
  Widget build(BuildContext context) {
    AppModel app = Provider.of<AppModel>(context, listen: true);

    return ListView.builder(
      itemCount: app.pages.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        PageInfo info = app.pages[index];

        return Row(
          children: <Widget>[
            ConstrainedBox(
              constraints: BoxConstraints.expand(width: 32),
              child: Icon(
                  index == 0
                      ? FontAwesomeIcons.home
                      : FontAwesomeIcons.chevronRight,
                  color: Colors.red[400]),
            ),
            Text(
              info.title,
              style: TextStyle(fontSize: 20),
            )
          ],
        );
      },
    );
  }
}
