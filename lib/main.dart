import 'package:ecom_getx/utils/routes_utils.dart';
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
      getPages: [
        GetPage(name: MyRoutes.home, page: () => HomePage()),
      ],
    );
  }
}
