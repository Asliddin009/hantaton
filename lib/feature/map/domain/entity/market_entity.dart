import 'package:hantaton_app/feature/posts/domain/entity/author/author_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'market_entity.freezed.dart';
part 'market_entity.g.dart';

@freezed
class MarkerEntity with _$MarkerEntity {

  const factory MarkerEntity({
    required int id,
    required String name,
    String? content,
    String? preContent,
    AuthorEntity? author,
  }) = _MarkerEntity;

  factory MarkerEntity.fromJson(Map<String, dynamic> json) =>
      _$MarkerEntityFromJson(json);
}
