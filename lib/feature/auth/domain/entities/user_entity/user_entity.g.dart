// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserEntityImpl _$$UserEntityImplFromJson(Map<String, dynamic> json) =>
    _$UserEntityImpl(
      username: json['username'] as String,
      description: json['description'] as String?,
      photo: json['photo'] as String?,
      id: json['id'] as int,
      first_name: json['first_name'] as String?,
      last_name: json['last_name'] as String?,
      accessToken: json['accessToken'] as String?,
      refreshToken: json['refreshToken'] as String?,
    );

Map<String, dynamic> _$$UserEntityImplToJson(_$UserEntityImpl instance) =>
    <String, dynamic>{
      'username': instance.username,
      'description': instance.description,
      'photo': instance.photo,
      'id': instance.id,
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
    };
