import 'package:get/get.dart';
import 'package:latihaneric/views/add_product.dart';
import 'package:latihaneric/views/edit_product.dart';
import 'package:latihaneric/views/home.dart';

class Routes {
  // static List<GetMiddleware> middlewares = [AuthMiddlewares()];

  static final pages = [
    GetPage(
      name: HomePage.routeName,
      page: () => HomePage(),
    ),
    GetPage(
      name: AddProductPage.routeName,
      page: () => AddProductPage(),
    ),
    GetPage(
      name: EditProductPage.routeName,
      page: () => EditProductPage(),
    ),
  ];
}
