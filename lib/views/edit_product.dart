import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihaneric/controllers/product_controller.dart';
import 'package:latihaneric/views/widget/custom_textfield.dart';

class EditProductPage extends StatelessWidget {
  static const routeName = '/edit-product-page';

  const EditProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productC = Get.put(ProductController());

    productC.titleC!.text = productC.detailProduct!.title!;
    productC.descC!.text = productC.detailProduct!.description!;
    productC.priceC!.text = productC.detailProduct!.price!.toString();
    productC.urlC!.text = productC.detailProduct!.image!;

    return Scaffold(
        appBar: AppBar(
          title: Text('Edit Product'),
          actions: [
            IconButton(
              onPressed: () {
                productC.updateProduct(productC.detailProduct!.id!);
              },
              icon: Icon(Icons.save),
            )
          ],
        ),
        body: GetBuilder<ProductController>(
          builder: (tx) => ListView(
            padding: EdgeInsets.all(10),
            children: [
              inputForm('Judul', productC.titleC),
              inputForm('Deskripsi', productC.descC),
              inputForm('Price', productC.priceC),
              inputForm('Url Image', productC.urlC),
            ],
          ),
        ));
  }
}
