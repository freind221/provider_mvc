import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:provider_mvc/provider/fav_provider.dart';
import 'package:provider_mvc/view/fav/fav_list_screen.dart';

class FavScreen extends StatefulWidget {
  const FavScreen({Key? key}) : super(key: key);

  @override
  State<FavScreen> createState() => _FavScreenState();
}

class _FavScreenState extends State<FavScreen> {
  @override
  Widget build(BuildContext context) {
    print('-------Widget tree -----------');

    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Favorite Screen')),
          actions: [
            InkWell(
                onTap: () {
                  Get.to(() => const FavLit());
                },
                child: const Icon(Icons.favorite))
          ],
        ),
        body: Consumer<FavProvider>(builder: ((context, value, child) {
          return ListView.builder(itemBuilder: ((context, index) {
            return ListTile(
              onTap: () {
                if (value.selectedItem.contains(index)) {
                  value.remove(index);
                } else {
                  value.setItem(index);
                }
              },
              leading: Text("Item $index"),
              trailing: Icon(value.selectedItem.contains(index)
                  ? Icons.favorite
                  : Icons.favorite_border_outlined),
            );
          }));
        })));
  }
}
