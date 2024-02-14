import 'package:dio/dio.dart';
import '../domain/models/product.dart';
import '../domain/models/products_list.dart';

class ProductsDIOData {
  Stream<ProductsList> getProductsData() async* {
    final response = await Dio().get('https://fakestoreapi.com/products');

    final data = response.data as List<dynamic>;
    yield data.map((e) => Product.fromJson(e)).toList();
  }
}
