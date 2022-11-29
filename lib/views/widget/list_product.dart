// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihaneric/controllers/product_controller.dart';
import 'package:latihaneric/models/product_model.dart';
import 'package:latihaneric/views/edit_product.dart';
import 'package:latihaneric/views/widget/custom_network_image.dart';
import 'package:lottie/lottie.dart';

class WidgetListProduct extends StatelessWidget {
  var listProduct = <ProductModel?>[].obs;

  WidgetListProduct({
    Key? key,
    required this.listProduct,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productC = Get.find<ProductController>();

    return listProduct.isEmpty
        ? Container(
            alignment: Alignment.center,
            child: Lottie.network(
                'https://assets10.lottiefiles.com/packages/lf20_V0sqL0iu1s.json',
                height: 200),
          )
        : Obx(
            () => RefreshIndicator(
              onRefresh: () => productC.getProduct(),
              child: ListView.separated(
                  padding: EdgeInsets.all(10),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    ProductModel data = listProduct[index]!;

                    return Dismissible(
                      key: Key(data.id.toString()),
                      background: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        padding: EdgeInsets.all(10),
                        alignment: Alignment.centerRight,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.delete,
                              color: Colors.grey.shade400,
                            ),
                            Icon(
                              Icons.delete,
                              color: Colors.grey.shade400,
                            ),
                          ],
                        ),
                      ),
                      direction: DismissDirection.horizontal,
                      onDismissed: (direction) {
                        productC.deleteProduct(data.id!);
                      },
                      child: Card(
                        elevation: 3,
                        child: Container(
                          padding: EdgeInsets.all(5),
                          child: Row(
                            children: [
                              Container(
                                width: 100,
                                height: 120,
                                child: customNetworkImage(
                                  data.image!,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      data.title!,
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      data.description!,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          " \$ ${data.price}",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        IconButton(
                                            onPressed: () {
                                              productC.detailProduct =
                                                  listProduct[index];
                                              Get.toNamed(
                                                EditProductPage.routeName,
                                              );
                                            },
                                            icon: Icon(
                                              Icons.edit,
                                            )),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 5,
                    );
                  },
                  itemCount: listProduct.length),
            ),
          );
  }
}
