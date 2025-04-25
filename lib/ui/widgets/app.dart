import 'package:edu/ui/navigation/main_navigation.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    MainNavigation mainNavigation = MainNavigation();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: mainNavigation.routes,
      initialRoute: mainNavigation.initialRoute,
      onGenerateRoute: (settings) => mainNavigation.onGenerateRoute(settings),
    );
  }
}
