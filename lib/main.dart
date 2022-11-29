import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihaneric/utils/routes.dart';
import 'package:latihaneric/views/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomePage.routeName,
      getPages: Routes.pages,
    );
  }
}
