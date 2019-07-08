import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_provider_snippet/views/home.dart';
import 'package:flutter_provider_snippet/views/page1.dart';
import 'package:flutter_provider_snippet/views/page2.dart';
import 'constants.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
     switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (_) => HomePage(title: 'Flutter Demo Home Page'));
      case page1Route:
        return MaterialPageRoute(builder: (_) => Page1());
      case page2Route:
        return MaterialPageRoute(builder: (_) => Page2());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }

}