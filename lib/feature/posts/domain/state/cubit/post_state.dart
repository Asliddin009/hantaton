part of 'post_cubit.dart';

@freezed
class PostState with _$PostState {
  const factory PostState({
    @JsonKey(ignore: true) AsyncSnapshot? asyncSnapshot,
    @Default([]) List<PostEntity> postList,
    @Default(15) int fetchLimit,
    @Default(0) int offset,
  }) = _PostState;
}
