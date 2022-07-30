import 'package:flutter/material.dart';

class ValNotifier extends StatelessWidget {
  ValNotifier({Key? key}) : super(key: key);

  ValueNotifier<int> count = ValueNotifier<int>(0);
  ValueNotifier<bool> toggle = ValueNotifier<bool>(true);
  @override
  Widget build(BuildContext context) {
    print('--------Widget Tree---------');
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.deepOrangeAccent,
        title: const Text("Statles Widgets"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          ValueListenableBuilder(
              valueListenable: toggle,
              builder: ((context, value, child) {
                return TextFormField(
                  obscureText: toggle.value,
                  decoration: InputDecoration(
                    suffix: InkWell(
                        onTap: () {
                          toggle.value = !toggle.value;
                        },
                        child: Icon(toggle.value
                            ? Icons.visibility_off_outlined
                            : Icons.visibility)),
                    hintText: 'Password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                );
              })),
          Center(
            child: ValueListenableBuilder(
                valueListenable: count,
                builder: ((context, value, child) {
                  return Text(
                    count.value.toString(),
                    style: const TextStyle(fontSize: 20),
                  );
                })),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          count.value++;
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
