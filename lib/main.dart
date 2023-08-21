import 'package:ecom_getx/utils/routes_utils.dart';
import 'package:ecom_getx/views/screens/cart_page.dart';
import 'package:ecom_getx/views/screens/desc_page.dart';
import 'package:ecom_getx/views/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
      ),
      getPages: [
        GetPage(name: MyRoutes.home, page: () => HomePage()),
        GetPage(name: MyRoutes.cart, page: () => CartPage()),
        GetPage(name: MyRoutes.desc, page: () => DetailPage()),
      ],
    );
  }
}
