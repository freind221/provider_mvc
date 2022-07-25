import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_mvc/provider/provider_class.dart';

class CounterClass extends StatefulWidget {
  const CounterClass({Key? key}) : super(key: key);

  @override
  State<CounterClass> createState() => _CounterClassState();
}

class _CounterClassState extends State<CounterClass> {
  @override
  void initState() {
    final countprovider = Provider.of<CounterProvider>(context, listen: false);
    Timer.periodic(const Duration(seconds: 1), ((timer) {
      countprovider.setCount();
    }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //here we gave context to provider of type CounterProvider and we did listen false because we do not want the whole tree to rebuild
    final countprovider = Provider.of<CounterProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider Counter'),
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        height: 100,
        width: 100,
        //This is the property of the provider. Here we consume the value of class CounterProvider efficiently
        child: Consumer<CounterProvider>(
          builder: ((context, value, child) {
            return Text(value.count.toString());
          }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          countprovider.setCount();
        },
      ),
    );
  }
}
