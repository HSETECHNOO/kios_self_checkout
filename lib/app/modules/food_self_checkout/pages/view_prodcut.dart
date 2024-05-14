import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:food_self_checkout/app/constants/constants_colors.dart';
import 'package:food_self_checkout/app/modules/food_self_checkout/controllers/food_self_checkout_controller.dart';
import 'package:food_self_checkout/app/modules/food_self_checkout/models/modifiers_group_model.dart';
import 'package:food_self_checkout/app/modules/food_self_checkout/models/modifiers_model.dart';
import 'package:get/get.dart';

class ViewModifiersScreen extends StatelessWidget {
  const ViewModifiersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FoodSelfCheckoutController>(builder: (controller) {
      return (controller.showsViewModifiers == false)
          ? Container()
          : Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.white,
              child: ListView(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 40, left: 100, right: 100),
                    child: Row(
                      children: [
                        const Text(
                          "View Add's On",
                          style: TextStyle(
                              fontSize: 32, fontWeight: FontWeight.w600),
                        ),
                        const Spacer(),
                        IconButton(
                            icon: const Icon(Icons.arrow_back),
                            color: Colors.black,
                            iconSize: 52,
                            onPressed: () {
                              controller.selectedprodcut = null;
                              controller.showsViewModifiers = false;
                              controller.refreshUpdate();
                            }),
                        const Text(
                          'Back',
                          style: TextStyle(
                              fontSize: 32, fontWeight: FontWeight.w600),
                        ),
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
                          child: Column(
                            children: [
                              SizedBox(child: Image.asset('images/burger.png')),
                            ],
                          ),
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
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(width: 20),
                                Wrap(
                                  children: controller.selectedprodcut!
                                      .modifiersTypes!.sizeGroup!.sizes!
                                      .map((e) {
                                    bool isSlected = e.isSelected ?? false;
                                    if (isSlected == false) {
                                      return Container();
                                    }
                                    return Padding(
                                      padding: const EdgeInsets.only(right: 20),
                                      child: InkWell(
                                        onTap: () {},
                                        child: Container(
                                          height: 80,
                                          width: 80,
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
                                    );
                                  }).toList(),
                                )
                              ],
                            ),
                            const SizedBox(height: 20),
                            Text(
                              "Size Price: \$${controller.selectedprodcut!.modifiersTypes!.sizeGroup!.sizes!.firstWhere((element) => element.isSelected == true).price.toString()}",
                              style: const TextStyle(
                                  fontSize: 38, fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 20, top: 20),
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: controller.selectedprodcut!
                                    .modifiersTypes!.modifiersGroups!.length,
                                itemBuilder: (context, index) {
                                  ModifiersGroup group = controller
                                      .selectedprodcut!
                                      .modifiersTypes!
                                      .modifiersGroups![index];
                                  if (group.modifiers!
                                      .where((element) {
                                        bool isSelected =
                                            element.isSelected ?? false;
                                        return isSelected;
                                      })
                                      .toList()
                                      .isEmpty) {
                                    return Container();
                                  }
                                  return buildModifiersGroup(group, controller);
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: Container(
                                  height: 130,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                          color: Colors.grey.shade400),
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
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: Colors.grey.shade200),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10, right: 10),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Text('QTY',
                                                  style:
                                                      TextStyle(fontSize: 22)),
                                              Text(
                                                  controller
                                                      .selectedprodcut!.qty
                                                      .toString(),
                                                  style: const TextStyle(
                                                      fontSize: 22)),
                                            ],
                                          ),
                                        ),
                                      )),
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
              ),
            );
    });
  }

  Widget buildModifiersGroup(
      ModifiersGroup group, FoodSelfCheckoutController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          buildDottedBorder(group, controller),
          buildGroupName(group),
          if (group.isSelect != null) buildMaxSelectionWarning(),
        ],
      ),
    );
  }

  Widget buildDottedBorder(
      ModifiersGroup group, FoodSelfCheckoutController controller) {
    return DottedBorder(
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
              Modifiers modifiers = group.modifiers![groupIndex];
              bool isSelected = modifiers.isSelected ?? false;
              if (isSelected == false) {
                return Container();
              }
              return buildModifierItem(modifiers, group, controller);
            },
          ),
        ),
      ),
    );
  }

  Widget buildModifierItem(Modifiers modifiers, ModifiersGroup group,
      FoodSelfCheckoutController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            buildModifierSelection(modifiers, group, controller),
            if (modifiers.image != null) buildModifierImage(),
            Expanded(
              child: Text(
                "${modifiers.name!} ${modifiers.price == null ? '' : '(\$${modifiers.price.toString()})'} ",
                style: const TextStyle(
                  fontSize: 17,
                  color: Colors.black87,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            if (group.isSelect == null)
              modifiers.isSelected != true
                  ? Container()
                  : Container(
                      height: 45,
                      width: 150,
                      decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(12),
                              bottomRight: Radius.circular(12))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('X ${modifiers.qty.toString()}',
                              style: const TextStyle(
                                  fontSize: 22, color: Colors.white)),
                        ],
                      ),
                    )
          ],
        ),
      ),
    );
  }

  Widget buildModifierSelection(Modifiers modifiers, ModifiersGroup group,
      FoodSelfCheckoutController controller) {
    return group.isSelect != null
        ? Builder(builder: (context) {
            bool isSelected = modifiers.isSelected ?? false;
            return Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: InkWell(
                onTap: () {},
                child: Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                    color: isSelected ? AppColors.whitecolor : null,
                    border: Border.all(
                      color: modifiers.isSelected != null
                          ? AppColors.primaryColor
                          : Colors.grey,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: isSelected
                      ? Center(
                          child: Container(
                            height: 18,
                            width: 18,
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              shape: BoxShape.circle,
                            ),
                          ),
                        )
                      : Container(),
                ),
              ),
            );
          })
        : Padding(
            padding: const EdgeInsets.only(left: 10, right: 20),
            child: Checkbox(
              activeColor: AppColors.primaryColor,
              checkColor: AppColors.whitecolor,
              focusColor: Colors.amber,
              value: modifiers.isSelected ?? false,
              onChanged: (val) {},
            ),
          );
  }

  Widget buildModifierImage() {
    return Padding(
      padding: const EdgeInsets.only(top: 10, right: 10, bottom: 10),
      child: Image.asset('images/burger.png'),
    );
  }

  Widget buildGroupName(ModifiersGroup group) {
    return Positioned(
      top: -15,
      left: 20,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Text(
            group.name.toString(),
            style: const TextStyle(
              fontSize: 17,
              color: Colors.black87,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildMaxSelectionWarning() {
    return Positioned(
      top: -15,
      right: 25,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: const Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Text(
            '* Maximum Select 1',
            style: TextStyle(
              fontSize: 17,
              color: Colors.red,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
