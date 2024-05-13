import 'package:get/get.dart';

import '../controllers/food_self_checkout_controller.dart';

class FoodSelfCheckoutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FoodSelfCheckoutController>(
      () => FoodSelfCheckoutController(),
    );
  }
}
