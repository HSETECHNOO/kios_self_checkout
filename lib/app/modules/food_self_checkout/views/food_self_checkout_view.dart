import 'package:flutter/material.dart';
import 'package:food_self_checkout/app/modules/food_self_checkout/pages/add_modifiers.dart';
import 'package:food_self_checkout/app/modules/food_self_checkout/pages/order_header.dart';
import 'package:food_self_checkout/app/modules/food_self_checkout/pages/orders_body.dart';
import 'package:food_self_checkout/app/modules/food_self_checkout/pages/orders_footer.dart';
import 'package:get/get.dart';
import '../controllers/food_self_checkout_controller.dart';

class FoodSelfCheckoutView extends GetView<FoodSelfCheckoutController> {
  const FoodSelfCheckoutView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<FoodSelfCheckoutController>(
        init: FoodSelfCheckoutController(),
        builder: (controller) {
          return Scaffold(
              backgroundColor: Colors.white,
              body: controller.showsModifiersScreen
                  ? const AddModifiersScreen()
                  : const FoodSelfCheckOutViewBody());
        });
  }
}

class FoodSelfCheckOutViewBody extends StatelessWidget {
  const FoodSelfCheckOutViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return GetBuilder<FoodSelfCheckoutController>(builder: (controller) {
      return SizedBox(
        child: Column(
          children: [
            SizedBox(
              height: screenSize.height * 0.15,
              child: const OrdersHeader(),
            ),
            const Expanded(child: OrdersBodyScreen()),
            SizedBox(
              height: screenSize.height * 0.25,
              child: const OrdersFooter(),
            ),
          ],
        ),
      );
    });
  }
}
