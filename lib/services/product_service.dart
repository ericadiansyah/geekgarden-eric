import 'package:get/get.dart';
import 'package:latihaneric/models/product_model.dart';

class ProductService extends GetConnect {
  // Future<Response> getProduct() {
  //   String uri = 'https://fakestoreapi.com/products?limit=9';
  //   String content = 'application/json';

  //   return get(uri, contentType: content);

  // }

  Future<List<ProductModel?>?> getListProduct() async {
    try {
      Response? json = await get("https://fakestoreapi.com/products?limit=3");
      List<ProductModel?>? response = [];
      if (json.statusCode == 200) {
        var rawData = json.body;

        rawData.forEach((element) {
          response.add(ProductModel.fromJson(element));
        });
      }

      return response;
    } catch (e) {
      throw (e);
    }
  }
}
