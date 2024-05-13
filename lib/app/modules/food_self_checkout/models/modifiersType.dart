// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:food_self_checkout/app/modules/food_self_checkout/models/modifiers_group_model.dart';
import 'package:food_self_checkout/app/modules/food_self_checkout/models/sizegroup_model.dart';

class ModifiersTypes {
  final List<ModifiersGroup>? modifiersGroups;
  final SizeGroup? sizeGroup;
  ModifiersTypes({
    this.modifiersGroups,
    this.sizeGroup,
  });

  ModifiersTypes copyWith({
    List<ModifiersGroup>? modifiersGroups,
    SizeGroup? sizeGroup,
  }) {
    return ModifiersTypes(
      modifiersGroups: modifiersGroups ?? this.modifiersGroups,
      sizeGroup: sizeGroup ?? this.sizeGroup,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'modifiersGroups': modifiersGroups!.map((x) => x.toMap()).toList(),
      'sizeGroup': sizeGroup?.toMap(),
    };
  }

  factory ModifiersTypes.fromMap(Map<String, dynamic> map) {
    return ModifiersTypes(
      modifiersGroups: map['modifiersGroups'] != null
          ? List<ModifiersGroup>.from(
              (map['modifiersGroups'] as List<int>).map<ModifiersGroup?>(
                (x) => ModifiersGroup.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      sizeGroup: map['sizeGroup'] != null
          ? SizeGroup.fromMap(map['sizeGroup'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ModifiersTypes.fromJson(String source) =>
      ModifiersTypes.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'ModifiersTypes(modifiersGroups: $modifiersGroups, sizeGroup: $sizeGroup)';

  @override
  bool operator ==(covariant ModifiersTypes other) {
    if (identical(this, other)) return true;

    return listEquals(other.modifiersGroups, modifiersGroups) &&
        other.sizeGroup == sizeGroup;
  }

  @override
  int get hashCode => modifiersGroups.hashCode ^ sizeGroup.hashCode;
}
