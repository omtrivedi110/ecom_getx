import 'package:ecom_getx/controller/cart_controller.dart';
import 'package:ecom_getx/modals/cart_modals.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class CartPage extends StatelessWidget {
  CartPage({super.key});

  CartController controller = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart Details"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Obx(() {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: CartController.cart_products.length,
                  itemBuilder: (context, index) {
                    Products products = CartController.cart_products[index];
                    return Obx(() {
                      return ListTile(
                        leading: CircleAvatar(
                          foregroundImage: NetworkImage(products.thumb),
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            controller.delete(products: products);
                          },
                          icon: const Icon(Icons.delete_forever_rounded),
                        ),
                        title: Text(products.title),
                        subtitle: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                              onPressed: () {
                                controller.increaseQty(index: index);
                                controller.totalAmount();
                              },
                              icon: const Icon(Icons.add),
                            ),
                            Text(
                              products.qty.value.toString(),
                            ),
                            IconButton(
                              onPressed: () {
                                controller.decrease(index: index);
                                controller.totalAmount();
                              },
                              icon: const Icon(Icons.exposure_minus_1_outlined),
                            ),
                          ],
                        ),
                      );
                    });
                  },
                ),
              ),
              Obx(() {
                controller.totalAmount();
                return Align(
                  alignment: Alignment.bottomCenter,
                  child: Text("Your Total Amount = ${controller.amount}"),
                );
              })
            ],
          );
        }),
      ),
    );
  }
}
