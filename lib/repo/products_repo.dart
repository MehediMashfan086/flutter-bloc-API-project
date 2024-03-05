import 'package:bloc_api_project/models/product_models.dart';
import 'package:http/http.dart' as http;

class ProductsRepo {
  Future<List<ProductsModel>> getProducts() async {
    var response =
        await http.get(Uri.parse("https://fakestoreapi.com/products"));
    if (response.statusCode == 200) {
      return productsModelFromJson(response.body);
    } else {
      throw Exception("Failed to load Products");
    }
  }
}
