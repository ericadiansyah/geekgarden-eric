// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihaneric/controllers/product_controller.dart';
import 'package:latihaneric/models/product_model.dart';

class WidgetListProduct extends StatelessWidget {
  var listProduct = <ProductModel?>[].obs;

  WidgetListProduct({
    Key? key,
    required this.listProduct,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productC = Get.find<ProductController>();

    return Container(
      child: ListView(
        padding: EdgeInsets.all(10),
        children: [
          listProduct.isEmpty
              ? Center(
                  child: Text('Data Kosong'),
                )
              : Obx(
                  () => ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        ProductModel data = listProduct[index]!;

                        return Dismissible(
                          key: Key(data.id.toString()),
                          background: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            padding: EdgeInsets.all(10),
                            alignment: Alignment.centerRight,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                                Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                              ],
                            ),
                          ),
                          direction: DismissDirection.horizontal,
                          onDismissed: (direction) {
                            productC.deleteProduct(data.id!);
                          },
                          child: Container(
                            child: Row(
                              children: [
                                Container(
                                  width: 100,
                                  height: 100,
                                  child: Image.network(
                                    data.image!,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                      Text(
                                        " \$ ${data.price}",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => Divider(),
                      itemCount: listProduct.length),
                ),
          SizedBox(height: 24)
        ],
      ),
    );
  }
}
