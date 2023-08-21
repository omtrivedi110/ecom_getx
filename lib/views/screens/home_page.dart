import 'package:ecom_getx/helpers/cart_helper.dart';
import 'package:ecom_getx/modals/cart_modals.dart';
import 'package:ecom_getx/utils/routes_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed(MyRoutes.cart);
            },
            icon: const Icon(Icons.shopping_cart_rounded),
          ),
        ],
      ),
      body: FutureBuilder(
        future: ApiHelper.apiHelper.assign(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Products products = snapshot.data![index];
                return ListTile(
                  onTap: () => Get.toNamed(MyRoutes.desc, arguments: products),
                  title: Text(products.title),
                  leading: CircleAvatar(
                    foregroundImage: NetworkImage(products.thumb),
                    child: Text("${index + 1}"),
                  ),
                  subtitle: Text(
                    products.desc,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text(
              snapshot.error.toString(),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
