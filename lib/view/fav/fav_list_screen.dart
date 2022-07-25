import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_mvc/provider/fav_provider.dart';

class FavLit extends StatefulWidget {
  const FavLit({Key? key}) : super(key: key);

  @override
  State<FavLit> createState() => _FavLitState();
}

class _FavLitState extends State<FavLit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("YOUR FAVS"),
      ),
      body: Consumer<FavProvider>(builder: ((context, value, child) {
        return ListView.builder(
            itemCount: value.selectedItem.length,
            itemBuilder: ((context, index) {
              return ListTile();
            }));
      })),
    );
  }
}
