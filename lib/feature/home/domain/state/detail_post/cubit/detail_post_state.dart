part of 'detail_post_cubit.dart';

@freezed
class DetailPostState with _$DetailPostState {
  const factory DetailPostState({
    @Default(AsyncSnapshot.nothing()) AsyncSnapshot asyncSnapshot,
    PostEntity? postEntity,
  }) = _DetailPostState;
}
