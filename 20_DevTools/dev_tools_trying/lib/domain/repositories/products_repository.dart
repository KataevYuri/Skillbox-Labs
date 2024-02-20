import 'package:dev_tools_trying/data/get_products_dio.dart';
import 'package:dev_tools_trying/domain/models/products_list.dart';

class ProductsRepository {
  Future<ProductsList> getProducts() async {
    return await ProductsDIOData().getProductsData();
  }
}
