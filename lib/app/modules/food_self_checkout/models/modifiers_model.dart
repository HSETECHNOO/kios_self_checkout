// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Modifiers {
  final String? name;
  final double? price;
  final int? qty;
  final String? image;
  bool? isSelected;
  Modifiers({
    this.name,
    this.price,
    this.qty,
    this.image,
    this.isSelected,
  });

  Modifiers copyWith({
    String? name,
    double? price,
    int? qty,
    String? image,
    bool? isSelected,
  }) {
    return Modifiers(
      name: name ?? this.name,
      price: price ?? this.price,
      qty: qty ?? this.qty,
      image: image ?? this.image,
      isSelected: isSelected ?? this.isSelected,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'price': price,
      'qty': qty,
      'image': image,
      'isSelected': isSelected,
    };
  }

  factory Modifiers.fromMap(Map<String, dynamic> map) {
    return Modifiers(
      name: map['name'] != null ? map['name'] as String : null,
      price: map['price'] != null ? map['price'] as double : null,
      qty: map['qty'] != null ? map['qty'] as int : null,
      image: map['image'] != null ? map['image'] as String : null,
      isSelected: map['isSelected'] != null ? map['isSelected'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Modifiers.fromJson(String source) =>
      Modifiers.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Modifiers(name: $name, price: $price, qty: $qty, image: $image, isSelected: $isSelected)';
  }

  @override
  bool operator ==(covariant Modifiers other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.price == price &&
        other.qty == qty &&
        other.image == image &&
        other.isSelected == isSelected;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        price.hashCode ^
        qty.hashCode ^
        image.hashCode ^
        isSelected.hashCode;
  }
}
