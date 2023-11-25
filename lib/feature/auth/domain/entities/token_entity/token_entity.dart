import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'token_entity.freezed.dart';

part 'token_entity.g.dart';

@freezed
class TokenEntity with _$TokenEntity {
  const factory TokenEntity({
    String? access,
    String? refresh,
  }) = _TokenEntity;

  factory TokenEntity.fromJson(Map<String, dynamic> json) =>
      _$TokenEntityFromJson(json);
}
