import 'package:firebase_app/data/get_products_dio.dart';
import 'package:firebase_app/domain/models/products_list.dart';

class ProductsRepository {
  Future<ProductsList> getProducts() async {
    return await ProductsDIOData().getProductsData();
  }
}
