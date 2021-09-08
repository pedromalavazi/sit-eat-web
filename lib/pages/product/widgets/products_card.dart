import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final double font;
  ProductCard({required this.font});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: FlutterLogo(),
      title: Text(
        'Parmegianna',
        style: TextStyle(fontSize: 15),
      ),
      subtitle: Text(
        'Filé mignon, arroz e fritas',
        style: TextStyle(fontSize: 10),
      ),
      trailing: Text("RS19,90"),
    );
  }
}
