import 'package:flutter/material.dart';
import 'package:food_self_checkout/app/modules/food_self_checkout/controllers/food_self_checkout_controller.dart';
import 'package:food_self_checkout/app/constants/constants_colors.dart';
import 'package:get/get.dart';

class OrdersHeader extends StatelessWidget {
  const OrdersHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FoodSelfCheckoutController>(builder: (controller) {
      return LayoutBuilder(builder: (context, _) {
        double height = _.maxHeight;
        double width = _.maxWidth;
        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: AppColors.primaryColor,
              image: const DecorationImage(
                  image: AssetImage('images/promotion.png'),
                  fit: BoxFit.fitWidth)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 40, bottom: 5),
                child: SizedBox(
                    height: height * 0.40,
                    width: width * 0.30,
                    child: Image.asset(
                      'images/logo.png',
                      fit: BoxFit.fill,
                    )),
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 37),
                  child: Text(
                    'HSE Techno Kiosk - Self Ordering System',
                    style: TextStyle(
                        color: AppColors.fOODColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
                  ))
            ],
          ),
        );
      });
    });
  }
}
