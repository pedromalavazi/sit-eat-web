import 'package:flutter/material.dart';

class DefaultPage extends StatefulWidget {
  @override
  _DefaultPage_State createState() => _DefaultPage_State();
}

class _DefaultPage_State extends State<DefaultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  _body() {
    return Center(
      child: Text("Default"),
    );
  }
}
