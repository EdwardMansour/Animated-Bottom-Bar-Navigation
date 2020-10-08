import 'package:estatetial_interm_test/features/test/buttom_bar_navigation/bottom_bar_navigation_pattern.dart';
import 'package:flutter/material.dart';

//!--Edward Mansour 08-10-2020

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => BottomBarNavigation(),
        );
        return _errorRoute();
      default:
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
