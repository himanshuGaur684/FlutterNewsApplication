import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news/main.dart';
import 'package:flutter_news/ui/details/details_screen.dart';
import 'package:flutter_news/ui/home/home_screen.dart';

class RoutingTable {
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    final args = routeSettings.arguments;
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case '/detail_screen':
        return MaterialPageRoute(builder: (_) => Detailscreen(args));
    }
  }
}
