import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sit_eat_web/utils/app_model.dart';
import 'package:sit_eat_web/pages/admin/adminpages/aprovar_page.dart';
import 'package:sit_eat_web/pages/admin/adminpages/default_page.dart';
import 'package:sit_eat_web/pages/admin/adminpages/restaurantes/restaurantes_page.dart';

class ItemMenu {
  String title;
  IconData icon;
  Widget page;

  bool select = false;

  ItemMenu(this.title, this.icon, this.page);
}

class Menu extends StatefulWidget {
  @override
  Menu_State createState() => Menu_State();
}

class Menu_State extends State<Menu> {
  List<ItemMenu> menus = [];

  @override
  void initState() {
    super.initState();

    menus.add(ItemMenu("Home", FontAwesomeIcons.home, DefaultPage()));
    menus.add(ItemMenu(
        "Restaurantes", FontAwesomeIcons.bookOpen, RestaurantesPage()));
    menus.add(
        ItemMenu("Aprovar", FontAwesomeIcons.clipboardCheck, AprovarPage()));
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: menus.length,
        itemBuilder: (context, index) {
          ItemMenu item = menus[index];
          return _itemMenu(item);
        });
  }

  _itemMenu(ItemMenu item) {
    return Material(
      color: item.select ? Colors.red[100] : Colors.transparent,
      child: InkWell(
        hoverColor: Colors.red[200],
        splashColor: Colors.red,
        onTap: () {
          AppModel app = Provider.of<AppModel>(context, listen: false);
          app.push(PageInfo(item.title, item.page), replace: true);

          setState(() {
            menus.forEach((item) => item.select = false);

            item.select = true;
          });
        },
        child: ListTile(
          leading: Icon(item.icon, color: Colors.red[400]),
          title: Text(item.title,
              style: TextStyle(
                  fontWeight:
                      item.select ? FontWeight.bold : FontWeight.normal)),
        ),
      ),
    );
  }
}
