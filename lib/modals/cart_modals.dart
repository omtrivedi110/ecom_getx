import 'package:get/get_rx/src/rx_types/rx_types.dart';

class Products {
  final String title;
  final String desc;
  final int price;
  final String thumb;
  final List images;
  RxInt qty = 1.obs;

  Products(
      {required this.desc,
      required this.images,
      required this.price,
      required this.thumb,
      required this.title}) {}

  factory Products.formMap({required Map data}) {
    return Products(
      desc: data['description'],
      images: data['images'],
      price: data['price'],
      thumb: data['thumbnail'],
      title: data['title'],
    );
  }
}
