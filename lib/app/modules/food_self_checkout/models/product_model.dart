// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:food_self_checkout/app/modules/food_self_checkout/models/modifiersType.dart';

class Product {
  final int? id;
  final String? name;
  final double? price;
  int? qty;
  final int? categoryId;
  final ModifiersTypes? modifiersTypes;

  Product({
    this.id,
    this.name,
    this.price,
    this.qty,
    this.categoryId,
    this.modifiersTypes,
  });

  double calculateTotalAmount() {
    double totalAmount = 0.0;
    if (modifiersTypes != null &&
        modifiersTypes!.modifiersGroups != null &&
        modifiersTypes!.sizeGroup != null) {
      for (var modifiersGroup in modifiersTypes!.modifiersGroups!) {
        if (modifiersGroup.modifiers != null) {
          for (var modifier in modifiersGroup.modifiers!) {
            if (modifier.isSelected != null && modifier.isSelected!) {
              if (modifier.qty == null) {
                totalAmount += modifier.price ?? 0.0;
              } else {
                totalAmount += (modifier.price ?? 0.0) * modifier.qty!;
              }
            }
          }
        }
      }

      if (modifiersTypes!.sizeGroup!.sizes != null) {
        for (var size in modifiersTypes!.sizeGroup!.sizes!) {
          if (size.isSelected != null && size.isSelected!) {
            totalAmount += size.price ?? 0.0;
          }
        }
      }
    } else {
      totalAmount = price ?? 0.0;
    }

    return totalAmount * qty!;
  }

  double calculateModifiersAmount() {
    double totalAmount = 0.0;
    if (modifiersTypes != null &&
        modifiersTypes!.modifiersGroups != null &&
        modifiersTypes!.sizeGroup != null) {
      for (var modifiersGroup in modifiersTypes!.modifiersGroups!) {
        if (modifiersGroup.modifiers != null) {
          for (var modifier in modifiersGroup.modifiers!) {
            if (modifier.isSelected != null && modifier.isSelected!) {
              if (modifier.qty == null) {
                totalAmount += modifier.price ?? 0.0;
              } else {
                totalAmount += (modifier.price ?? 0.0) * modifier.qty!;
              }
            }
          }
        }
      }
    }

    return totalAmount * qty!;
  }

  Product copyWith({
    int? id,
    String? name,
    double? price,
    int? qty,
    int? categoryId,
    ModifiersTypes? modifiersTypes,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      qty: qty ?? this.qty,
      categoryId: categoryId ?? this.categoryId,
      modifiersTypes: modifiersTypes ?? this.modifiersTypes,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'price': price,
      'qty': qty,
      'categoryId': categoryId,
      'modifiersTypes': modifiersTypes?.toMap(),
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      price: map['price'] != null ? map['price'] as double : null,
      qty: map['qty'] != null ? map['qty'] as int : null,
      categoryId: map['categoryId'] != null ? map['categoryId'] as int : null,
      modifiersTypes: map['modifiersTypes'] != null
          ? ModifiersTypes.fromMap(
              map['modifiersTypes'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Product(id: $id, name: $name, price: $price, qty: $qty, categoryId: $categoryId, modifiersTypes: $modifiersTypes)';
  }

  @override
  bool operator ==(covariant Product other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.price == price &&
        other.qty == qty &&
        other.categoryId == categoryId &&
        other.modifiersTypes == modifiersTypes;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        price.hashCode ^
        qty.hashCode ^
        categoryId.hashCode ^
        modifiersTypes.hashCode;
  }
}
