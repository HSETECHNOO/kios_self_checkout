// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:food_self_checkout/app/modules/food_self_checkout/models/modifiers_model.dart';

class ModifiersGroup {
  final bool? isSelect;
  final String? name;
  final List<Modifiers>? modifiers;
  ModifiersGroup({
    this.isSelect,
    this.name,
    this.modifiers,
  });

  ModifiersGroup copyWith({
    bool? isSelect,
    String? name,
    List<Modifiers>? modifiers,
  }) {
    return ModifiersGroup(
      isSelect: isSelect ?? this.isSelect,
      name: name ?? this.name,
      modifiers: modifiers ?? this.modifiers,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'isSelect': isSelect,
      'name': name,
      'modifiers': modifiers!.map((x) => x.toMap()).toList(),
    };
  }

  factory ModifiersGroup.fromMap(Map<String, dynamic> map) {
    return ModifiersGroup(
      isSelect: map['isSelect'] != null ? map['isSelect'] as bool : null,
      name: map['name'] != null ? map['name'] as String : null,
      modifiers: map['modifiers'] != null
          ? List<Modifiers>.from(
              (map['modifiers'] as List<int>).map<Modifiers?>(
                (x) => Modifiers.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ModifiersGroup.fromJson(String source) =>
      ModifiersGroup.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'ModifiersGroup(isSelect: $isSelect, name: $name, modifiers: $modifiers)';

  @override
  bool operator ==(covariant ModifiersGroup other) {
    if (identical(this, other)) return true;

    return other.isSelect == isSelect &&
        other.name == name &&
        listEquals(other.modifiers, modifiers);
  }

  @override
  int get hashCode => isSelect.hashCode ^ name.hashCode ^ modifiers.hashCode;
}
