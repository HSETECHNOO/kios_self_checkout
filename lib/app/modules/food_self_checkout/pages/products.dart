import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:food_self_checkout/app/constants/constants_colors.dart';
import 'package:food_self_checkout/app/modules/food_self_checkout/controllers/food_self_checkout_controller.dart';
import 'package:food_self_checkout/app/modules/food_self_checkout/models/product_model.dart';
import 'package:get/get.dart';

class ProductSide extends StatelessWidget {
  const ProductSide({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FoodSelfCheckoutController>(builder: (controller) {
      return Scrollbar(
        trackVisibility: true,
        thumbVisibility: true,
        thickness: 6,
        interactive: true,
        controller: controller.productScrollController,
        child: ListView(
          controller: controller.productScrollController,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: Text(
                controller.selectedCategory,
                style: TextStyle(
                    color: AppColors.headingTextColor,
                    fontSize: 32,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                'Browse sub categories below:',
                style: TextStyle(),
              ),
            ),
            Wrap(
                children: controller.subCategories.toList().map((e) {
              bool isselected = e.name == controller.selectedSubCategory;
              return Padding(
                padding: const EdgeInsets.only(left: 20, right: 5, top: 15),
                child: InkWell(
                  onTap: () {
                    controller.setSubSelectedCategory(e.name);
                    controller.filterProducts(e.id);
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    height: 75,
                    width: 200,
                    decoration: BoxDecoration(
                        color: isselected
                            ? AppColors.headingTextColor
                            : Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Center(
                        child: Text(
                          e.name,
                          style: TextStyle(
                              color: isselected
                                  ? Colors.white
                                  : AppColors.headingTextColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }).toList()),
            SizedBox(
              child: controller.productsList.isEmpty
                  ? SizedBox(
                      height: 500,
                      child: Center(
                        child: Text(
                          'No Product Found of ${controller.selectedSubCategory.isEmpty ? controller.selectedCategory : controller.selectedSubCategory} Category',
                          style: const TextStyle(fontSize: 22),
                        ),
                      ),
                    )
                  : GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3),
                      itemCount: controller.productsList.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        Product product = controller.productsList[index];
                        return Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 20, bottom: 20),
                          child: InkWell(
                            onTap: () async {
                              controller.setShowsModifiersScreen(product);
                            },
                            child: DottedBorder(
                              borderType: BorderType.RRect,
                              radius: const Radius.circular(12),
                              padding: const EdgeInsets.all(12),
                              strokeWidth: 0.5,
                              dashPattern: const [6, 4],
                              color: Colors.black,
                              child: Center(
                                child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                            height: 80,
                                            child: Image.asset(
                                                index.isEven
                                                    ? 'images/pizza.png'
                                                    : 'images/burger.png',
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
                                        controller.cartList
                                                .where((element) =>
                                                    element.id == product.id)
                                                .isEmpty
                                            ? Container()
                                            : Text(
                                                '${controller.cartList.where((element) => element.id == product.id).length.toString()} X Added ',
                                                style: TextStyle(
                                                    color:
                                                        AppColors.primaryColor,
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                      ],
                                    )),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      );
    });
  }
}
