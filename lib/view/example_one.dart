import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_mvc/provider/example_one_provider.dart';

class ExampleOne extends StatefulWidget {
  const ExampleOne({Key? key}) : super(key: key);

  @override
  State<ExampleOne> createState() => _ExampleOneState();
}

class _ExampleOneState extends State<ExampleOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Provider Slider")),
      body: Consumer<ExampleOneProvider>(builder: ((context, value, child) {
        return Column(
          children: [
            Slider(
              value: value.val,
              onChanged: (valu) {
                value.setState(valu);
              },
            ),
            Row(
              children: [
                Expanded(
                    child: Container(
                        height: 100,
                        color: Colors.amberAccent.withOpacity(value.val))),
                Expanded(
                  child: Container(
                    height: 100,
                    color: Colors.deepPurpleAccent.withOpacity(value.val),
                  ),
                )
              ],
            )
          ],
        );
      })),
    );
  }
}
