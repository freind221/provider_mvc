import 'package:flutter/material.dart';
import 'package:provider_mvc/utitlities/routes/routes_name.dart';
import 'package:provider_mvc/view/home_screen.dart';
import 'package:provider_mvc/view/login_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RouteNames.home:
        return MaterialPageRoute(
            builder: ((BuildContext context) => const HomePage()));
      case RouteNames.login:
        return MaterialPageRoute(
            builder: ((BuildContext context) => const LoginPage()));

      default:
        return MaterialPageRoute(builder: ((_) {
          return const Scaffold(
            body: Center(child: Text("No page Defined")),
          );
        }));
    }
  }
}
