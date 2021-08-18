import 'package:flutter/material.dart';
import 'package:sit_eat_web/pages/admin/adminpages/default_page.dart';
import 'package:sit_eat_web/pages/admin/adminpages/restaurantes/restaurante_form_page.dart';
import 'package:sit_eat_web/pages/admin/adminpages/restaurantes/restaurante_page.dart';
import 'package:sit_eat_web/pages/admin/web/menuteste.dart';

class PageInfo {
  String title;
  Widget page;

  PageInfo(this.title, this.page);

  @override
  String toString() {
    return title;
  }
}

class AppModel extends ChangeNotifier {
  List<PageInfo> pages = [];

  PageInfo defaultPage = PageInfo("Home", TestPage());

  AppModel() {
    pages.add(defaultPage);
  }

  push(PageInfo page, {replace = false}) {
    if (replace) {
      this.pages.clear();

      this.pages.add(PageInfo("Home", DefaultPage()));
    }

    if (page.title != "Home") {
      this.pages.add(page);
    }

    notifyListeners();
  }

  void pop() {
    this.pages.removeLast();

    notifyListeners();
  }
}
