// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PostEntityImpl _$$PostEntityImplFromJson(Map<String, dynamic> json) =>
    _$PostEntityImpl(
      id: json['id'] as int,
      name: json['name'] as String,
      content: json['content'] as String?,
      preContent: json['preContent'] as String?,
      author: json['author'] == null
          ? null
          : AuthorEntity.fromJson(json['author'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PostEntityImplToJson(_$PostEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'content': instance.content,
      'preContent': instance.preContent,
      'author': instance.author,
    };
