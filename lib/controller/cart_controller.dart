import 'package:ecom_getx/modals/cart_modals.dart';

import 'package:get/get.dart';

class CartController extends GetxController {
  RxInt amount = 0.obs;
  static RxList<Products> cart_products = <Products>[].obs;
  RxInt tmp_amount = 0.obs;

  addProduct({required Products products}) {
    if (cart_products.contains(products)) {
      return Get.snackbar("Already Added !!😊", "Done",
          snackPosition: SnackPosition.BOTTOM);
    } else {
      cart_products.add(products);
      return Get.snackbar("Added..😊", "Thak You !",
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  totalAmount() {
    amount = 0.obs;
    for (var element in cart_products) {
      tmp_amount.value += element.price;
      tmp_amount.value *= element.qty.toInt();
      amount.value += tmp_amount.toInt();
      tmp_amount = 0.obs;
    }
  }

  increaseQty({required int index}) {
    cart_products[index].qty.value++;
  }

  decrease({required int index}) {
    if (cart_products[index].qty.value == 0) {
      cart_products.removeAt(index);
    } else {
      cart_products[index].qty.value--;
    }
  }

  delete({required Products products}) {
    cart_products.remove(products);
  }
}
