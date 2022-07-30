import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider_mvc/utitlities/routes/routes_name.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, RouteNames.home);
                },
                child: Text("Click"))));
  }
}
