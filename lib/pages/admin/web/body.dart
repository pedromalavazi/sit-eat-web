import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sit_eat_web/utils/app_model.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppModel app = Provider.of<AppModel>(context);

    PageInfo info = app.pages.last;
    return info.page;
  }
}
