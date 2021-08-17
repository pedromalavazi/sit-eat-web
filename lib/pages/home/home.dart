import 'package:flutter/material.dart';
import 'package:sit_eat_web/utils/constants.dart';
import 'package:sit_eat_web/pages/admin/web/body.dart';
import 'package:sit_eat_web/pages/admin/web/breadcrumb.dart';
import 'package:sit_eat_web/pages/admin/web/header.dart';
import 'package:sit_eat_web/pages/admin/web/menu.dart';

class HomePage extends StatefulWidget {
  @override
  HomePage_State createState() => HomePage_State();
}

class HomePage_State extends State<HomePage> {
  Size get size => MediaQuery.of(context).size;

  bool get showMenu => size.width > 500;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          _header(),
          _body(),
        ],
      ),
    );
  }

  _header() {
    return Container(
      padding: EdgeInsets.all(16),
      width: size.width,
      height: headerHeight,
      color: Colors.red,
      child: Header(),
    );
  }

  _body() {
    return Container(
      width: size.width,
      height: size.height - headerHeight,
      child: showMenu
          ? Row(
              children: <Widget>[
                _menu(),
                _right(),
              ],
            )
          : _right(),
    );
  }

  _menu() {
    return Container(
      width: menuWidht,
      color: Colors.grey[300],
      child: Menu(),
    );
  }

  _right() {
    return Container(
      width: showMenu ? size.width - menuWidht : size.width,
      child: Column(
        children: <Widget>[
          Container(
            color: Colors.grey[200],
            width: size.width,
            height: 48,
            child: BreadCrumb(),
          ),
          Expanded(
            child: Body(),
          ),
        ],
      ),
    );
  }
}
