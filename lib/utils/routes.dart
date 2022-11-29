import 'package:get/get.dart';
import 'package:latihaneric/views/home.dart';

class Routes {
  // static List<GetMiddleware> middlewares = [AuthMiddlewares()];

  static final pages = [
    GetPage(
      name: HomePage.routeName,
      page: () => HomePage(),
    ),
  ];
}
