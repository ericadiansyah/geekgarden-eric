import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihaneric/controllers/product_controller.dart';
import 'package:latihaneric/views/add_product.dart';
import 'package:latihaneric/views/widget/list_product.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/home-page';

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productC = Get.put(ProductController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed(AddProductPage.routeName);
            },
            icon: Icon(Icons.add_to_photos_sharp),
          )
        ],
      ),
      body: Obx(
        () => productC.isLoading.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            : WidgetListProduct(listProduct: productC.listProduct),
      ),
    );
  }
}
