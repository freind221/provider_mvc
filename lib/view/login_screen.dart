import 'package:flutter/material.dart';
import 'package:provider_mvc/resources/components/button.dart';

import 'package:provider_mvc/utitlities/utiles.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  ValueNotifier<bool> toggle = ValueNotifier<bool>(true);
  final TextEditingController _emailEditingController = TextEditingController();
  final TextEditingController _passwordEditingController =
      TextEditingController();

  FocusNode emailfocusnode = FocusNode();
  FocusNode passwordfocusnode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
          centerTitle: true,
          elevation: 0,
        ),
        body: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              //This keyboard type would able @ sig in keyboard
              keyboardType: TextInputType.emailAddress,
              controller: _emailEditingController,
              focusNode: emailfocusnode,
              decoration: const InputDecoration(
                hintText: 'Email',
                prefixIcon: Icon(Icons.alternate_email),
              ),
              onFieldSubmitted: (value) {
                Utils.focusCange(context, emailfocusnode, passwordfocusnode);
              },
            ),
            ValueListenableBuilder(
                valueListenable: toggle,
                builder: ((context, value, child) {
                  return TextFormField(
                    obscureText: toggle.value,
                    controller: _passwordEditingController,
                    decoration: InputDecoration(
                        suffix: InkWell(
                            onTap: () {
                              toggle.value = !toggle.value;
                            },
                            child: Icon(toggle.value
                                ? Icons.visibility_off_outlined
                                : Icons.visibility)),
                        hintText: 'Password',
                        prefixIcon: const Icon(Icons.lock_outline)),
                  );
                })),
            CustoButton(
                title: 'Login',
                onPressed: () {
                  if (_emailEditingController.text.isEmpty) {
                    Utils.flushBarSnakError('Email cannot be empty', context);
                  } else if (_passwordEditingController.text.isEmpty) {
                    Utils.flushBarSnakError(
                        'Password cannot be empty', context);
                  } else if (_passwordEditingController.text.length < 6) {
                    Utils.flushBarSnakError(
                        'Password length is so small', context);
                  } else {
                    Utils.flushBarSnakError('Done', context);
                  }
                })
          ],
        )));
  }
}
