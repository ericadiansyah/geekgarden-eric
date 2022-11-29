import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihaneric/controllers/product_controller.dart';
import 'package:latihaneric/views/widget/custom_textfield.dart';

class AddProductPage extends StatelessWidget {
  static const routeName = '/add-product-page';

  const AddProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productC = Get.find<ProductController>();
    return Scaffold(
        appBar: AppBar(
          title: Text('Add Product'),
          actions: [
            IconButton(
              onPressed: () {
                productC.addProduct();
              },
              icon: Icon(Icons.save),
            )
          ],
        ),
        body: ListView(
          padding: EdgeInsets.all(10),
          children: [
            inputForm('Judul', productC.titleC),
            inputForm('Deskripsi', productC.descC),
            inputForm('Price', productC.priceC),
            inputForm('Url Image', productC.urlC),
          ],
        ));
  }
}
