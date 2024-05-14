import 'package:flutter/material.dart';
import 'package:food_self_checkout/app/modules/food_self_checkout/pages/add_modifiers.dart';
import 'package:food_self_checkout/app/modules/food_self_checkout/pages/order_header.dart';
import 'package:food_self_checkout/app/modules/food_self_checkout/pages/orders_body.dart';
import 'package:food_self_checkout/app/modules/food_self_checkout/pages/orders_footer.dart';
import 'package:food_self_checkout/app/modules/food_self_checkout/pages/view_prodcut.dart';
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
              body: Stack(
                children: [
                  controller.showsModifiersScreen
                      ? const AddModifiersScreen()
                      : const FoodSelfCheckOutViewBody(),
                  AnimatedPositioned(
                      duration: const Duration(seconds: 3),
                      bottom: controller.showsViewModifiers == true ? 0 : -2000,
                      // bottom: 0,
                      // right: 0,
                      // left: 0,
                      top: controller.showsViewModifiers == true ? 200 : 0,
                      child: const ViewModifiersScreen()),
                ],
              ));
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
              height: screenSize.height * 0.05,
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
