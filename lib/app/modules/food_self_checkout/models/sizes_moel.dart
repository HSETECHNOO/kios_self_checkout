// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Sizes {
  final int? size;
  bool? isSelected;
  final double? price;
  Sizes({
    this.size,
    this.isSelected,
    this.price,
  });

  Sizes copyWith({
    int? size,
    bool? isSelected,
    double? price,
  }) {
    return Sizes(
      size: size ?? this.size,
      isSelected: isSelected ?? this.isSelected,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'size': size,
      'isSelected': isSelected,
      'price': price,
    };
  }

  factory Sizes.fromMap(Map<String, dynamic> map) {
    return Sizes(
      size: map['size'] != null ? map['size'] as int : null,
      isSelected: map['isSelected'] != null ? map['isSelected'] as bool : null,
      price: map['price'] != null ? map['price'] as double : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Sizes.fromJson(String source) =>
      Sizes.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Sizes(size: $size, isSelected: $isSelected, price: $price)';

  @override
  bool operator ==(covariant Sizes other) {
    if (identical(this, other)) return true;

    return other.size == size &&
        other.isSelected == isSelected &&
        other.price == price;
  }

  @override
  int get hashCode => size.hashCode ^ isSelected.hashCode ^ price.hashCode;
}
