import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihaneric/models/product_model.dart';
import 'package:latihaneric/services/product_service.dart';

class ProductController extends GetxController {
  TextEditingController? titleC = TextEditingController();
  TextEditingController? descC = TextEditingController();
  TextEditingController? priceC = TextEditingController();
  TextEditingController? urlC = TextEditingController();

  var listProduct = <ProductModel?>[].obs;
  ProductModel? detailProduct = Get.arguments;

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

  Future addProduct() async {
    isLoading.value = true;
    Random random = new Random();
    int randomNumber = random.nextInt(90) + 10;

    try {
      listProduct.add(ProductModel(
        id: randomNumber,
        title: titleC!.text,
        category: "men's clothing",
        description: descC!.text,
        price: double.parse(priceC!.text),
        image: urlC!.text,
      ));
      titleC!.text = '';
      descC!.text = '';
      priceC!.text = '';
      urlC!.text = '';

      isLoading.value = false;
      Get.back();
      update();
    } catch (ex) {
      isLoading.value = false;
    }
  }

  Future deleteProduct(int id) async {
    isLoading.value = true;

    try {
      listProduct.removeWhere((element) => element!.id == id);

      isLoading.value = false;
      update();
    } catch (ex) {
      isLoading.value = false;
    }
  }

  Future updateProduct(int id) async {
    isLoading.value = true;

    try {
      listProduct.forEach((element) {
        if (element!.id == id) {
          element.title = titleC!.text;
          element.description = descC!.text;
          element.price = double.parse(priceC!.text);
          element.image = urlC!.text;
        }
      });

      titleC!.text = '';
      descC!.text = '';
      priceC!.text = '';
      urlC!.text = '';

      isLoading.value = false;
      Get.back();
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

  @override
  void dispose() {
    titleC!.dispose();
    descC!.dispose();
    priceC!.dispose();
    urlC!.dispose();
    super.dispose();
  }
}
