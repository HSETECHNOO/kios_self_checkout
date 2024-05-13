// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';

import '../modules/food_self_checkout/bindings/food_self_checkout_binding.dart';
import '../modules/food_self_checkout/views/food_self_checkout_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.FOOD_SELF_CHECKOUT;

  static final routes = [
    GetPage(
      name: _Paths.FOOD_SELF_CHECKOUT,
      page: () => const FoodSelfCheckoutView(),
      binding: FoodSelfCheckoutBinding(),
    ),
  ];
}
