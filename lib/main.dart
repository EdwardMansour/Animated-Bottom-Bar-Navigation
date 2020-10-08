import 'package:estatetial_interm_test/core/routes/route_generator.dart';
import 'package:flutter/material.dart';
import 'core/injection/dependancy_injection.dart';
import 'core/navigator_service/navigator_service.dart';

//!--Edward Mansour 08-10-2020

void main() {
  init();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // builder: DevicePreview.appBuilder,
      title: 'Smart Pricing',
      navigatorKey: locator<NavigationService>().navigatorKey,
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
