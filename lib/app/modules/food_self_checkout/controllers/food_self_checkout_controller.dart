// ignore_for_file: public_member_api_docs, sort_constructors_first, recursive_getters

import 'package:flutter/material.dart';
import 'package:food_self_checkout/app/modules/food_self_checkout/models/modifiersType.dart';
import 'package:food_self_checkout/app/modules/food_self_checkout/models/modifiers_group_model.dart';
import 'package:food_self_checkout/app/modules/food_self_checkout/models/modifiers_model.dart';
import 'package:food_self_checkout/app/modules/food_self_checkout/models/product_model.dart';
import 'package:food_self_checkout/app/modules/food_self_checkout/models/sizegroup_model.dart';
import 'package:food_self_checkout/app/modules/food_self_checkout/models/sizes_moel.dart';
import 'package:get/get.dart';

class FoodSelfCheckoutController extends GetxController {
  bool showsModifiersScreen = false;
  Product? selectedprodcut;

  setShowsModifiersScreen(Product product) {
    selectedprodcut = null;
    if (product.modifiersTypes == null) {
      addItemtoCartlist(product);
    } else {
      selectedprodcut = Product(
          id: product.id,
          name: product.name,
          modifiersTypes: product.modifiersTypes,
          price: product.price,
          categoryId: product.categoryId,
          qty: 1);
      showsModifiersScreen = true;
    }
    update();
  }

  ScrollController scrollController = ScrollController();
  ScrollController productScrollController = ScrollController();
  ScrollController categoriesController = ScrollController();
  List<FoodCategory> subCategories = [];
  late List<Product> productsList = products;

  setSelectedcategories(int id) {
    if (selectedCategory == 'All Categories') {
      productsList = products;
    } else {
      subCategories =
          categories.where((element) => element.parentId == id).toList();
      filterProducts(id);
    }
    update();
  }

  filterProducts(int id) {
    productsList =
        products.where((element) => element.categoryId == id).toList();
    update();
  }

  String selectedCategory = 'All Categories';
  setSelectedCategory(String val) {
    selectedCategory = val;
    update();
  }

  String selectedSubCategory = '';
  setSubSelectedCategory(String val) {
    selectedSubCategory = val;
    update();
  }

  refreshUpdate() {
    update();
  }

  List<Product> cartList = [];

  addItemtoCartlist(Product product) {
    var excitingItem = cartList.firstWhere(
        (element) => element.id == product.id,
        orElse: () => Product());
    if (excitingItem.id == null) {
      cartList.add(Product(
          id: product.id,
          name: product.name,
          price: product.price,
          categoryId: product.categoryId,
          qty: 1));
    } else {
      excitingItem.qty = excitingItem.qty! + 1;
    }
    update();
  }

  final List<FoodCategory> categories = [
    FoodCategory(id: 1, parentId: null, name: 'Fast Food'),
    FoodCategory(id: 2, parentId: 1, name: 'Burger'),
    FoodCategory(id: 3, parentId: 1, name: 'Pizza'),
    FoodCategory(id: 4, parentId: null, name: 'Healthy Food'),
    FoodCategory(id: 5, parentId: 4, name: 'Salad'),
    FoodCategory(id: 6, parentId: 4, name: 'Smoothie'),
    FoodCategory(id: 7, parentId: 4, name: 'Grilled Chicken'),
    FoodCategory(id: 8, parentId: null, name: 'Asian Cuisine'),
    FoodCategory(id: 9, parentId: 8, name: 'Chinese'),
    FoodCategory(id: 10, parentId: 8, name: 'Japanese'),
    FoodCategory(id: 11, parentId: 8, name: 'Thai'),
    FoodCategory(id: 12, parentId: null, name: 'Italian Cuisine'),
    FoodCategory(id: 13, parentId: 12, name: 'Pasta'),
    FoodCategory(id: 14, parentId: 12, name: 'Pizza'),
    FoodCategory(id: 15, parentId: null, name: 'Desserts'),
    FoodCategory(id: 16, parentId: 15, name: 'Cake'),
    FoodCategory(id: 17, parentId: 15, name: 'Ice Cream'),
    FoodCategory(id: 18, parentId: null, name: 'Breakfast'),
    FoodCategory(id: 19, parentId: 18, name: 'Eggs'),
    FoodCategory(id: 20, parentId: 18, name: 'Pancakes'),
  ];
}

class FoodCategory {
  final int id;
  final int? parentId;
  final String name;

  FoodCategory({required this.id, this.parentId, required this.name});
}

final List<Product> products = [
  Product(
      id: 1,
      name: 'Cheeseburger',
      price: 5.99,
      categoryId: 1,
      modifiersTypes: ModifiersTypes(
        modifiersGroups: [
          ModifiersGroup(
            name: 'Chrust Type',
            isSelect: true,
            modifiers: [
              Modifiers(name: 'Thin Crust', isSelected: true),
              Modifiers(name: 'Deep Dish', price: 3.0),
              Modifiers(name: 'FlatBread', price: 2.0),
              Modifiers(name: 'Gluten Free', price: 4.0),
              Modifiers(name: 'Buttery', price: 3.0),
              Modifiers(name: 'Stuffed', price: 3.0),
            ],
          ),
          ModifiersGroup(
            name: 'Sauce',
            modifiers: [
              Modifiers(name: 'Modifier 1', price: 2.5, qty: 1),
              Modifiers(name: 'Modifier 2', price: 3.5, qty: 1),
            ],
          ),
          ModifiersGroup(
            name: 'Cheese',
            modifiers: [
              Modifiers(name: 'Modifier 1', price: 2.5, qty: 1),
              Modifiers(name: 'Modifier 2', price: 3.5, qty: 1),
            ],
          ),
          ModifiersGroup(
            name: 'Toppings',
            modifiers: [
              Modifiers(name: 'Balcon', price: 2.5, qty: 1, image: 'o'),
              Modifiers(name: 'Sossage', price: 3.5, qty: 1, image: 'o'),
              Modifiers(name: 'Chicken', price: 2.5, qty: 1, image: 'o'),
              Modifiers(name: 'Salami', price: 3.5, qty: 1, image: 'o'),
            ],
          ),
        ],
        sizeGroup: SizeGroup(
          sizes: [
            Sizes(size: 8, isSelected: true, price: 5.99),
            Sizes(size: 10, isSelected: false, price: 6.99),
            Sizes(size: 12, isSelected: false, price: 7.99),
          ],
        ),
      )),
  Product(id: 2, name: 'Pepperoni Pizza', price: 8.99, categoryId: 2),
  Product(id: 3, name: 'Caesar Salad', price: 6.49, categoryId: 2),
  Product(id: 4, name: 'Smoothie Mix', price: 4.99, categoryId: 4),
  Product(id: 5, name: 'Grilled Chicken Salad', price: 7.99, categoryId: 5),
  Product(id: 6, name: 'Sweet and Sour Chicken', price: 9.99, categoryId: 6),
  Product(id: 7, name: 'Sushi Roll', price: 12.99, categoryId: 7),
  Product(id: 8, name: 'Spaghetti Carbonara', price: 10.99, categoryId: 12),
  Product(id: 9, name: 'Tiramisu', price: 4.99, categoryId: 12),
  Product(id: 10, name: 'Chocolate Cake', price: 6.99, categoryId: 15),
  Product(id: 11, name: 'Vanilla Ice Cream', price: 3.99, categoryId: 15),
  Product(id: 12, name: 'Egg Benedict', price: 7.49, categoryId: 18),
  Product(id: 13, name: 'Blueberry Pancakes', price: 5.99, categoryId: 18),
];
