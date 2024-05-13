import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:food_self_checkout/app/constants/constants_colors.dart';
import 'package:food_self_checkout/app/modules/food_self_checkout/controllers/food_self_checkout_controller.dart';
import 'package:food_self_checkout/app/modules/food_self_checkout/models/modifiers_group_model.dart';
import 'package:food_self_checkout/app/modules/food_self_checkout/models/modifiers_model.dart';
import 'package:get/get.dart';

class AddModifiersScreen extends StatelessWidget {
  const AddModifiersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FoodSelfCheckoutController>(builder: (controller) {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40, left: 100, right: 100),
            child: Row(
              children: [
                const Text(
                  'Select Modifiers',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
                ),
                const Spacer(),
                IconButton(
                    icon: const Icon(Icons.arrow_back),
                    color: Colors.black,
                    iconSize: 52,
                    onPressed: () {
                      controller.showsModifiersScreen = false;
                      controller.refreshUpdate();
                    })
              ],
            ),
          ),
          Expanded(
              child: Row(
            children: [
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(50.0),
                child: Center(
                  child: Image.asset('images/burger.png'),
                ),
              )),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      controller.selectedprodcut!.name.toString(),
                      style: const TextStyle(
                          fontSize: 32, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Smoked brisket, tender ribs, smoked sausage, bacon & cheddar with lettuce, tomato, house BBQ & ranch.',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Icon(
                          Icons.monitor_heart,
                          size: 30,
                          color: AppColors.primaryColor,
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          'Allergens: Glutten, Eggs, Soy',
                          style: TextStyle(),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Row(
                      children: [
                        const Text(
                          'Size',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(width: 20),
                        Wrap(
                          children: controller.selectedprodcut!.modifiersTypes!
                              .sizeGroup!.sizes!
                              .map((e) => Padding(
                                    padding: const EdgeInsets.only(right: 20),
                                    child: InkWell(
                                      onTap: () {
                                        for (var element in controller
                                            .selectedprodcut!
                                            .modifiersTypes!
                                            .sizeGroup!
                                            .sizes!) {
                                          element.isSelected = false;
                                        }
                                        e.isSelected = true;
                                        controller.refreshUpdate();
                                      },
                                      child: Container(
                                        height: 70,
                                        width: 70,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          color: e.isSelected!
                                              ? AppColors.primaryColor
                                              : Colors.grey.shade300,
                                        ),
                                        child: Center(
                                          child: Text(
                                            '${e.size.toString()}"',
                                            style: TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.w600,
                                              color: e.isSelected!
                                                  ? AppColors.whitecolor
                                                  : null,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ))
                              .toList(),
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "\$${controller.selectedprodcut!.modifiersTypes!.sizeGroup!.sizes!.firstWhere((element) => element.isSelected == true).price.toString()}",
                      style: const TextStyle(
                          fontSize: 38, fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20, top: 20),
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: controller.selectedprodcut!.modifiersTypes!
                              .modifiersGroups!.length,
                          itemBuilder: (context, index) {
                            ModifiersGroup group = controller.selectedprodcut!
                                .modifiersTypes!.modifiersGroups![index];
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 30),
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
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: ListView.builder(
                                            shrinkWrap: true,
                                            itemCount: group.modifiers!.length,
                                            itemBuilder: (context, groupIndex) {
                                              Modifiers modifiers =
                                                  group.modifiers![groupIndex];
                                              return Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 5,
                                                    bottom: 5,
                                                    left: 20,
                                                    right: 20),
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      height: 50,
                                                      width: double.infinity,
                                                      decoration: BoxDecoration(
                                                          color: Colors
                                                              .grey.shade200,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12)),
                                                      child: Row(children: [
                                                        const SizedBox(
                                                            width: 20),
                                                        group.isSelect != null
                                                            ? Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                        left:
                                                                            10),
                                                                child: Builder(
                                                                    builder:
                                                                        (context) {
                                                                  bool
                                                                      isSelected =
                                                                      modifiers
                                                                              .isSelected ??
                                                                          false;
                                                                  return InkWell(
                                                                    onTap: () {
                                                                      for (var element
                                                                          in group
                                                                              .modifiers!) {
                                                                        element.isSelected =
                                                                            false;
                                                                      }
                                                                      modifiers
                                                                              .isSelected =
                                                                          !modifiers
                                                                              .isSelected!;
                                                                      controller
                                                                          .refreshUpdate();
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          25,
                                                                      width: 25,
                                                                      decoration: BoxDecoration(
                                                                          color: isSelected ? AppColors.whitecolor : null,
                                                                          border: Border.all(
                                                                            color: isSelected
                                                                                ? AppColors.primaryColor
                                                                                : Colors.grey,
                                                                          ),
                                                                          shape: BoxShape.circle),
                                                                      child: isSelected
                                                                          ? Center(
                                                                              child: Container(
                                                                                height: 18,
                                                                                width: 18,
                                                                                decoration: BoxDecoration(color: AppColors.primaryColor, shape: BoxShape.circle),
                                                                              ),
                                                                            )
                                                                          : Container(),
                                                                    ),
                                                                  );
                                                                }),
                                                              )
                                                            : Checkbox(
                                                                activeColor:
                                                                    AppColors
                                                                        .primaryColor,
                                                                checkColor:
                                                                    AppColors
                                                                        .whitecolor,
                                                                focusColor:
                                                                    Colors
                                                                        .amber,
                                                                value: modifiers
                                                                        .isSelected ??
                                                                    false,
                                                                onChanged:
                                                                    (val) {
                                                                  modifiers
                                                                          .isSelected =
                                                                      val;
                                                                  controller
                                                                      .refreshUpdate();
                                                                }),
                                                        const SizedBox(
                                                            width: 20),
                                                        modifiers.image != null
                                                            ? Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                        top: 10,
                                                                        right:
                                                                            10,
                                                                        bottom:
                                                                            10),
                                                                child: Image.asset(
                                                                    'images/burger.png'),
                                                              )
                                                            : Container(),
                                                        Expanded(
                                                          child: Text(
                                                            "${modifiers.name!} ${modifiers.price == null ? '' : '(\$${modifiers.price.toString()})'} ",
                                                            style: const TextStyle(
                                                                fontSize: 17,
                                                                color: Colors
                                                                    .black87,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                          ),
                                                        ),
                                                      ]),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            }),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: -15,
                                    left: 20,
                                    child: Container(
                                      decoration: const BoxDecoration(
                                          color: Colors.white),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20, right: 20),
                                        child: Text(
                                          group.name.toString(),
                                          style: const TextStyle(
                                              fontSize: 17,
                                              color: Colors.black87,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Container(
                          height: 130,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.grey.shade400),
                              color: Colors.grey.shade200),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text('Options Total:',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 22)),
                                    Text(
                                        '\$${controller.selectedprodcut!.calculateModifiersAmount().toStringAsFixed(2)}',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 22)),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text('Sub Total:',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 22)),
                                    Text(
                                        '\$${controller.selectedprodcut!.calculateTotalAmount().toStringAsFixed(2)}',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 22)),
                                  ],
                                ),
                              ],
                            ),
                          )),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Row(
                        children: [
                          Expanded(
                              flex: 4,
                              child: Container(
                                height: 55,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.grey.shade200),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            if (controller
                                                    .selectedprodcut!.qty! >
                                                1) {
                                              controller.selectedprodcut!.qty =
                                                  controller.selectedprodcut!
                                                          .qty! -
                                                      1;
                                            }
                                            controller.refreshUpdate();
                                          },
                                          icon: const Icon(Icons.remove)),
                                      Text(
                                          controller.selectedprodcut!.qty
                                              .toString(),
                                          style: const TextStyle(fontSize: 22)),
                                      IconButton(
                                          onPressed: () {
                                            controller.selectedprodcut!.qty =
                                                controller
                                                        .selectedprodcut!.qty! +
                                                    1;
                                            controller.refreshUpdate();
                                          },
                                          icon: const Icon(Icons.add)),
                                    ],
                                  ),
                                ),
                              )),
                          const SizedBox(width: 20),
                          Expanded(
                              flex: 6,
                              child: InkWell(
                                onTap: () {
                                  controller.cartList
                                      .add(controller.selectedprodcut!);
                                  controller.selectedprodcut = null;
                                  controller.productsList = products;
                                  controller.showsModifiersScreen = false;
                                  controller.refreshUpdate();
                                },
                                child: Container(
                                  height: 55,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: AppColors.primaryColor),
                                  child: const Center(
                                    child: Text(
                                      'Add to Cart',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22),
                                    ),
                                  ),
                                ),
                              ))
                        ],
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                        'Categories:By The Slice, Deep Dish, Pizza, Thin Crust SKU: N/A')
                  ],
                ),
              ))
            ],
          ))
        ],
      );
    });
  }
}
