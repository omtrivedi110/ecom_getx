import 'package:ecom_getx/controller/cart_controller.dart';
import 'package:ecom_getx/modals/cart_modals.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class DetailPage extends StatelessWidget {
  DetailPage({super.key});

  CartController controller = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    Products products = ModalRoute.of(context)!.settings.arguments as Products;
    return Scaffold(
      appBar: AppBar(
        title: Text(products.title),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              SizedBox(
                height: s.height * 0.4,
                child: Image.network(products.thumb),
              ),
              const SizedBox(height: 50),
              Text(products.desc),
            ],
          ),
        ),
      ),
      floatingActionButton: Obx(() {
        return FloatingActionButton(
          onPressed: () {
            controller.addProduct(products: products);
          },
          child: Column(
            children: [
              Text(
                "${CartController.cart_products.length}",
              ),
              const Icon(Icons.add_shopping_cart_outlined),
            ],
          ),
        );
      }),
    );
  }
}
