import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:provider_mvc/provider/example_one_provider.dart';
import 'package:provider_mvc/provider/fav_provider.dart';
import 'package:provider_mvc/provider/provider_class.dart';
import 'package:provider_mvc/utitlities/routes/route.dart';
import 'package:provider_mvc/utitlities/routes/routes_name.dart';
import 'package:provider_mvc/view/fav/fav_list_screen.dart';

import 'package:provider_mvc/view/fav/fav_screen.dart';
import 'package:provider_mvc/view/login_screen.dart';
import 'package:provider_mvc/view/valu_notifier.dart';
import 'package:provider_mvc/view_model/auth_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //here we have given the global context to out change notifier class
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => CounterProvider()),
          ChangeNotifierProvider(create: (_) => ExampleOneProvider()),
          ChangeNotifierProvider(create: (_) => FavProvider()),
          ChangeNotifierProvider(create: (_) => AuthViewModel())
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.deepOrange,
          ),
          //home: const LoginPage(),
          initialRoute: RouteNames.login,
          onGenerateRoute: Routes.generateRoute,
        ));
  }
}
