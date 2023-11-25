// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EventEntityImpl _$$EventEntityImplFromJson(Map<String, dynamic> json) =>
    _$EventEntityImpl(
      id: json['id'] as int?,
      placeId: json['placeId'] as int?,
      categoryId: json['categoryId'] as int?,
      minimumAge: json['minimumAge'] as int?,
      price: json['price'] as int?,
      organizatorId: json['organizatorId'] as int?,
      photo: json['photo'] as String?,
      name: json['name'] as String? ?? '',
      description: json['description'] as String? ?? '',
      dateStart: json['dateStart'] == null
          ? null
          : DateTime.parse(json['dateStart'] as String),
    );

Map<String, dynamic> _$$EventEntityImplToJson(_$EventEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'placeId': instance.placeId,
      'categoryId': instance.categoryId,
      'minimumAge': instance.minimumAge,
      'price': instance.price,
      'organizatorId': instance.organizatorId,
      'photo': instance.photo,
      'name': instance.name,
      'description': instance.description,
      'dateStart': instance.dateStart?.toIso8601String(),
    };
