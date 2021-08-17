import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Header extends StatefulWidget {
  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  GlobalKey _menuState = GlobalKey();

  Size get size => MediaQuery.of(context).size;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        FontAwesomeIcons.cocktail,
        color: Colors.white,
        size: 25,
      ),
      title: Text(
        "Sit & Eat",
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
      trailing: _right(),
    );
  }

  _right() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          'Admin',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        SizedBox(
          width: 20,
        ),
        InkWell(
          child: Icon(
            FontAwesomeIcons.portrait,
            color: Colors.white,
            size: 30,
          ),
          onTap: () {
            // abre o popup menu
            // dynamic state = _menuState.currentState;
            // state.showButtonMenu();
          },
        ),
        PopupMenuButton<String>(
          key: _menuState,
          padding: EdgeInsets.zero,
          onSelected: (value) {
            _onClickOptionMenu(context, value);
          },
          child: Icon(
            Icons.arrow_drop_down,
            size: 28,
            color: Colors.white,
          ),
          itemBuilder: (BuildContext context) => _getActions(),
        ),
      ],
    );
  }

  _getActions() {
    return <PopupMenuItem<String>>[
      PopupMenuItem<String>(
        value: "meus_dados",
        child: Text("Meus dados"),
      ),
      PopupMenuItem<String>(
        value: "alterar_senha",
        child: Text("Alterar senha"),
      ),
      PopupMenuItem<String>(
        value: "logout",
        child: Text("Logout"),
      ),
    ];
  }

  void _onClickOptionMenu(context, String value) {
    print("_onClickOptionMenu $value");
    if ("logout" == value) {
    } else if ("meus_dados" == value) {
    } else if ("alterar_senha" == value) {
    } else {}

    //alert(context, value);
  }
}
