import 'package:dio/dio.dart';

class ApiHelper {
  ApiHelper._();
  static final ApiHelper apiHelper = ApiHelper._();
  Dio dio = Dio();
  final String api = "https://dummyjson.com/products?limit=100";

  Future assign() async {
    Response response = await dio.get(api);
    if (response.statusCode == 200) {
      return response.data['products'];
    }
  }
}
