import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:food_self_checkout/app/constants/constants_colors.dart';
import 'package:food_self_checkout/app/modules/food_self_checkout/controllers/food_self_checkout_controller.dart';
import 'package:get/get.dart';

class CategoriesSide extends StatelessWidget {
  const CategoriesSide({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FoodSelfCheckoutController>(builder: (controller) {
      return Scrollbar(
        trackVisibility: true,
        thumbVisibility: true,
        thickness: 6,
        interactive: true,
        controller: controller.categoriesController,
        child: SizedBox(
          child: ListView.builder(
            controller: controller.categoriesController,
            itemCount: controller.categories.length + 1,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              int newIndex = index - 1;
              if (newIndex == -1) {
                return Builder(builder: (context) {
                  bool isSelected =
                      controller.selectedCategory == 'All Categories';
                  return Padding(
                    padding: const EdgeInsets.only(
                        left: 10, right: 20, top: 10, bottom: 10),
                    child: InkWell(
                      onTap: () async {
                        controller.subCategories.clear();
                        controller.setSubSelectedCategory('');
                        controller.setSelectedCategory('All Categories');
                        controller.setSelectedcategories(0);
                      },
                      child: SizedBox(
                        height: 100,
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
                                    color: isSelected
                                        ? AppColors.primaryColor
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(12)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                          height: 50,
                                          width: 50,
                                          child: Image.asset(
                                              index.isEven
                                                  ? 'images/pizza.png'
                                                  : 'images/burger.png',
                                              fit: BoxFit.fill)),
                                      Expanded(
                                          child: ListTile(
                                        subtitle: Text(
                                          '${products.length} Products',
                                          style: TextStyle(
                                            color: isSelected
                                                ? AppColors.whitecolor
                                                : null,
                                          ),
                                        ),
                                        title: Text(
                                          'All Categories',
                                          style: TextStyle(
                                              color: isSelected
                                                  ? AppColors.whitecolor
                                                  : null,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ))
                                    ],
                                  ),
                                )),
                          ),
                        ),
                      ),
                    ),
                  );
                });
              }

              FoodCategory category = controller.categories[newIndex];
              bool isSelected = controller.selectedCategory == category.name;

              if (category.parentId == null) {
                return Padding(
                  padding: const EdgeInsets.only(
                      left: 10, right: 20, top: 10, bottom: 10),
                  child: InkWell(
                    onTap: () async {
                      controller.setSubSelectedCategory('');
                      controller.setSelectedCategory(category.name);
                      controller.setSelectedcategories(category.id);
                    },
                    child: SizedBox(
                      height: 100,
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
                                  color: isSelected
                                      ? AppColors.primaryColor
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(12)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    SizedBox(
                                        height: 50,
                                        width: 50,
                                        child: Image.asset(
                                            index.isEven
                                                ? 'images/pizza.png'
                                                : 'images/burger.png',
                                            fit: BoxFit.fill)),
                                    Expanded(
                                        child: ListTile(
                                      subtitle: Text(
                                        '${controller.categories.where((element) => element.parentId == category.id).length} Sub Cat - ${products.where((element) => element.categoryId == category.id).length} Products',
                                        style: TextStyle(
                                          color: isSelected
                                              ? AppColors.whitecolor
                                              : null,
                                        ),
                                      ),
                                      title: Text(
                                        category.name,
                                        style: TextStyle(
                                            color: isSelected
                                                ? AppColors.whitecolor
                                                : null,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ))
                                  ],
                                ),
                              )),
                        ),
                      ),
                    ),
                  ),
                );
              } else {
                return Container();
              }
            },
          ),
        ),
      );
    });
  }
}
