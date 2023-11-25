// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'market_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MarkerEntityImpl _$$MarkerEntityImplFromJson(Map<String, dynamic> json) =>
    _$MarkerEntityImpl(
      id: json['id'] as int,
      name: json['name'] as String,
      content: json['content'] as String?,
      preContent: json['preContent'] as String?,
      author: json['author'] == null
          ? null
          : AuthorEntity.fromJson(json['author'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$MarkerEntityImplToJson(_$MarkerEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'content': instance.content,
      'preContent': instance.preContent,
      'author': instance.author,
    };
