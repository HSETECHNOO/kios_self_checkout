import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:food_self_checkout/app/constants/constants_colors.dart';
import 'package:food_self_checkout/app/modules/food_self_checkout/controllers/food_self_checkout_controller.dart';
import 'package:get/get.dart';

class OrdersFooter extends StatelessWidget {
  const OrdersFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FoodSelfCheckoutController>(builder: (controller) {
      return LayoutBuilder(builder: (context, _) {
        double height = _.maxHeight;
        double width = _.maxWidth;
        return SizedBox(
          width: width,
          height: height,
          child: Column(
            children: [
              buildOrderStatuswidget(controller, height),
              buildMycartWidget(controller, height),
              buildButtonsWidget(controller, height)
            ],
          ),
        );
      });
    });
  }

  buildOrderStatuswidget(FoodSelfCheckoutController controller, double height) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.fOODColor,
          image: const DecorationImage(
              image: AssetImage('images/process.png'), fit: BoxFit.fitWidth)),
      height: height * 0.20,
      width: double.infinity,
      child: Row(
        children: [
          const SizedBox(width: 20),
          Text('My Order #ORD5673- Dinning Table 8',
              style: TextStyle(
                  color: AppColors.whitecolor,
                  fontSize: 32,
                  fontWeight: FontWeight.bold)),
          const Spacer(),
          Builder(builder: (context) {
            double totalAmount = controller.cartList.fold(
                0.0,
                (previousValue, product) =>
                    previousValue + (product.price as double));
            return Text('\$${totalAmount.toStringAsFixed(2)}',
                style: TextStyle(
                    color: AppColors.whitecolor,
                    fontSize: 32,
                    fontWeight: FontWeight.bold));
          }),
          const SizedBox(width: 20),
        ],
      ),
    );
  }

  buildButtonsWidget(FoodSelfCheckoutController controller, double height) {
    return Row(
      children: [
        Expanded(
            child: MaterialButton(
          padding: const EdgeInsets.all(20),
          onPressed: () {},
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.primaryColor),
            height: height * 0.20,
            child: const Center(
              child: Text('Cancel Order',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold)),
            ),
          ),
        )),
        Expanded(
            child: MaterialButton(
          padding: const EdgeInsets.all(20),
          onPressed: () {},
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.headingTextColor),
            height: height * 0.20,
            child: const Center(
              child: Text('Complete Order',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold)),
            ),
          ),
        )),
      ],
    );
  }

  buildMycartWidget(FoodSelfCheckoutController controller, double height) {
    return Expanded(
      child: controller.cartList.isEmpty
          ? const Center(
              child: Text('Your Order is empty',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)))
          : Scrollbar(
              trackVisibility: true,
              thumbVisibility: true,
              thickness: 6,
              interactive: true,
              controller: controller.scrollController,
              child: SizedBox(
                height: 1000,
                child: ListView.builder(
                  controller: controller.scrollController,
                  itemCount: controller.cartList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    Product product = controller.cartList[index];
                    return Padding(
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, top: 20, bottom: 20),
                      child: InkWell(
                        onTap: () async {},
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            DottedBorder(
                              borderType: BorderType.RRect,
                              radius: const Radius.circular(12),
                              padding: const EdgeInsets.all(12),
                              strokeWidth: 0.5,
                              dashPattern: const [6, 4],
                              color: Colors.black,
                              child: SizedBox(
                                child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                            height: 100,
                                            child: Image.asset(
                                                'images/burger.png',
                                                fit: BoxFit.fill)),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            product.name.toString(),
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Text(
                                          'RS ${product.price.toString()}',
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    )),
                              ),
                            ),
                            Positioned(
                              top: -25,
                              right: -10,
                              child: IconButton(
                                  onPressed: () {
                                    controller.cartList.remove(product);
                                    controller.refreshUpdate();
                                  },
                                  icon: const Icon(
                                    Icons.cancel,
                                    size: 50,
                                    color: Colors.red,
                                  )),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
    );
  }
}
