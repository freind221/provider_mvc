// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:provider_mvc/resources/components/button.dart';

// import 'package:provider_mvc/utitlities/utiles.dart';
// import 'package:provider_mvc/view_model/auth_view_model.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({Key? key}) : super(key: key);

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   ValueNotifier<bool> toggle = ValueNotifier<bool>(true);
//   final TextEditingController _emailEditingController = TextEditingController();
//   final TextEditingController _passwordEditingController =
//       TextEditingController();

//   FocusNode emailfocusnode = FocusNode();
//   FocusNode passwordfocusnode = FocusNode();
//   bool stat = false;

//   @override
//   void dispose() {
//     _emailEditingController.dispose();
//     _passwordEditingController.dispose();
//     emailfocusnode.dispose();
//     passwordfocusnode.dispose();

//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final authview = Provider.of<AuthViewModel>(context);
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text('Login'),
//           centerTitle: true,
//           elevation: 0,
//         ),
//         body: SafeArea(
//             child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             TextFormField(
//               //This keyboard type would able @ sig in keyboard
//               keyboardType: TextInputType.emailAddress,
//               controller: _emailEditingController,
//               focusNode: emailfocusnode,
//               decoration: const InputDecoration(
//                 hintText: 'Email',
//                 prefixIcon: Icon(Icons.alternate_email),
//               ),
//               onFieldSubmitted: (value) {
//                 Utils.focusCange(context, emailfocusnode, passwordfocusnode);
//               },
//             ),
//             ValueListenableBuilder(
//                 valueListenable: toggle,
//                 builder: ((context, value, child) {
//                   return TextFormField(
//                     obscureText: toggle.value,
//                     controller: _passwordEditingController,
//                     decoration: InputDecoration(
//                         suffix: InkWell(
//                             onTap: () {
//                               toggle.value = !toggle.value;
//                             },
//                             child: Icon(toggle.value
//                                 ? Icons.visibility_off_outlined
//                                 : Icons.visibility)),
//                         hintText: 'Password',
//                         prefixIcon: const Icon(Icons.lock_outline)),
//                   );
//                 })),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.05,
//             ),
//             CustoButton(
//                 title: 'Login',
//                 isLoading: authview.loading,
//                 onPressed: () {
//                   if (_emailEditingController.text.isEmpty) {
//                     Utils.flushBarSnakError('Email cannot be empty', context);
//                   } else if (_passwordEditingController.text.isEmpty) {
//                     Utils.flushBarSnakError(
//                         'Password cannot be empty', context);
//                   } else if (_passwordEditingController.text.length < 6) {
//                     Utils.flushBarSnakError(
//                         'Password length is so small', context);
//                   } else if (_emailEditingController.text.contains('@')
//                       ? stat = false
//                       : stat = true) {
//                     if (stat == true) {
//                       Utils.flushBarSnakError("Email is not correct", context);
//                     }
//                   } else {
//                     Map data = {
//                       'email': _emailEditingController.text.toString(),
//                       'password': _passwordEditingController.text.toString()
//                     };
//                     authview.loginview(data, context);
//                     Utils.flushBarSnakError('Api Hit', context);
//                   }
//                 })
//           ],
//         )));
//   }
// }

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:provider_mvc/resources/components/button.dart';
import 'package:provider_mvc/utitlities/routes/routes_name.dart';
import 'package:provider_mvc/utitlities/utiles.dart';
import 'package:provider_mvc/view_model/auth_view_model.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    _emailController.dispose();
    _passwordController.dispose();

    emailFocusNode.dispose();
    passwordFocusNode.dispose();

    _obsecurePassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewMode = Provider.of<AuthViewModel>(context);

    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              focusNode: emailFocusNode,
              decoration: const InputDecoration(
                  hintText: 'Email',
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.alternate_email)),
              onFieldSubmitted: (valu) {
                Utils.focusCange(context, emailFocusNode, passwordFocusNode);
              },
            ),
            ValueListenableBuilder(
                valueListenable: _obsecurePassword,
                builder: (context, value, child) {
                  return TextFormField(
                    controller: _passwordController,
                    obscureText: _obsecurePassword.value,
                    focusNode: passwordFocusNode,
                    obscuringCharacter: "*",
                    decoration: InputDecoration(
                      hintText: 'Password',
                      labelText: 'Password',
                      prefixIcon: Icon(Icons.lock_open_rounded),
                      suffixIcon: InkWell(
                          onTap: () {
                            _obsecurePassword.value = !_obsecurePassword.value;
                          },
                          child: Icon(_obsecurePassword.value
                              ? Icons.visibility_off_outlined
                              : Icons.visibility)),
                    ),
                  );
                }),
            SizedBox(
              height: height * .085,
            ),
            CustoButton(
              title: 'Login',
              isLoading: authViewMode.signUpLoading,
              onPressed: () {
                if (_emailController.text.isEmpty) {
                  Utils.flushBarSnakError('Please enter email', context);
                } else if (_passwordController.text.isEmpty) {
                  Utils.flushBarSnakError('Please enter password', context);
                } else if (_passwordController.text.length < 6) {
                  Utils.flushBarSnakError(
                      'Please enter 6 digit password', context);
                } else {
                  Map data = {
                    'email': _emailController.text.toString(),
                    'password': _passwordController.text.toString(),
                  };

                  // Map data = {
                  //   'email' : 'eve.holt@reqres.in',
                  //   'password' : 'cityslicka',
                  // };

                  authViewMode.loginApi(data, context);
                  print('api hit');
                }
              },
            ),
            SizedBox(
              height: height * .02,
            ),
            InkWell(
                onTap: () {
                  Navigator.pushNamed(context, RouteNames.signup);
                },
                child: const Text("Don't have an accont? Sign Up"))
          ],
        ),
      ),
    );
  }
}
