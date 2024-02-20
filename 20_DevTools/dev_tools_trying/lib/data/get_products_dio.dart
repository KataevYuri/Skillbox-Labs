import 'package:dev_tools_trying/domain/models/product.dart';
import 'package:dev_tools_trying/domain/models/products_list.dart';
import 'package:dio/dio.dart';

class ProductsDIOData {
  Future<ProductsList> getProductsData() async {
    final response = await Dio().get('https://fakestoreapi.com/products');

    final data = response.data as List<dynamic>;
    return data.map((e) => Product.fromJson(e)).toList();
  }
}
