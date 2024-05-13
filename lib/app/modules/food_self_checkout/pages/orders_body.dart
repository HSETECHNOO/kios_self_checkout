import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_self_checkout/app/modules/food_self_checkout/controllers/food_self_checkout_controller.dart';
import 'package:food_self_checkout/app/modules/food_self_checkout/pages/categories.dart';
import 'package:food_self_checkout/app/modules/food_self_checkout/pages/products.dart';
import 'package:get/get.dart';

class OrdersBodyScreen extends StatelessWidget {
  const OrdersBodyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FoodSelfCheckoutController>(builder: (controller) {
      return const Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(flex: 3, child: CategoriesSide()),
          Expanded(flex: 7, child: ProductSide())
        ],
      );
    });
  }
}
