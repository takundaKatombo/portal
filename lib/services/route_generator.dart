import 'package:flutter/material.dart';
import 'package:portal/ui/screens/add_product.dart';
import 'package:portal/ui/screens/categories.dart';
import 'package:portal/ui/screens/home_page.dart';
import 'package:portal/ui/screens/orders.dart';
import 'package:portal/ui/screens/products.dart';
import 'package:portal/ui/screens/users.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    //final args = settings.arguments;
    //final BaseAuth auth = Provider.of<Auth>(context);

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => MyHomePage());

      case '/products':
        return MaterialPageRoute(builder: (_) => Products());

      case '/categories':
        return MaterialPageRoute(builder: (_) => Categories());

      case '/users':
        return MaterialPageRoute(builder: (_) => Users());

      case '/orders':
        return MaterialPageRoute(builder: (_) => Orders());

      case '/add':
        return MaterialPageRoute(builder: (_) => AddProduct());

      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
