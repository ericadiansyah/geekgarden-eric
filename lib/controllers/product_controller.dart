import 'package:get/get.dart';
import 'package:latihaneric/models/product_model.dart';
import 'package:latihaneric/services/product_service.dart';

class ProductController extends GetxController {
  var listProduct = <ProductModel?>[].obs;
  var isLoading = false.obs;

  Future<void> getProduct() async {
    isLoading.value = true;

    try {
      var response = await ProductService().getListProduct();

      listProduct.value = response!;
      isLoading.value = false;
      update();
    } catch (ex) {
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    getProduct();
    super.onInit();
  }
}
