// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:food_self_checkout/app/modules/food_self_checkout/models/sizes_moel.dart';

class SizeGroup {
  final groupname = 'Size';
  final List<Sizes>? sizes;
  SizeGroup({
    this.sizes,
  });

  SizeGroup copyWith({
    List<Sizes>? sizes,
  }) {
    return SizeGroup(
      sizes: sizes ?? this.sizes,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'sizes': sizes!.map((x) => x.toMap()).toList(),
    };
  }

  factory SizeGroup.fromMap(Map<String, dynamic> map) {
    return SizeGroup(
      sizes: map['sizes'] != null
          ? List<Sizes>.from(
              (map['sizes'] as List<int>).map<Sizes?>(
                (x) => Sizes.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SizeGroup.fromJson(String source) =>
      SizeGroup.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'SizeGroup(sizes: $sizes)';

  @override
  bool operator ==(covariant SizeGroup other) {
    if (identical(this, other)) return true;

    return listEquals(other.sizes, sizes);
  }

  @override
  int get hashCode => sizes.hashCode;
}
