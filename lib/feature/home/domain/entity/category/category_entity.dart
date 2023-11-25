import 'package:hantaton_app/feature/posts/domain/entity/author/author_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'event_entity.freezed.dart';

part 'event_entity.g.dart';

@freezed
class EventEntity with _$EventEntity {
  const factory EventEntity({
    int? id,
    int? placeId,
    int? categoryId,
    int? minimumAge,
    int? price,
    int? organizatorId,
    String? photo,
    @Default('') String name,
    @Default('') String description,
    DateTime dateStart,
  }) = _EventEntity;

  factory EventEntity.fromJson(Map<String, dynamic> json) =>
      _$EventEntityFromJson(json);
}
