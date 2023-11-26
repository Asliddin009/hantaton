part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @JsonKey(ignore: true) AsyncSnapshot? asyncSnapshot,
    @Default([]) List<CategoryEntity> categoryList,
    @Default([]) List<EventEntity> eventList,
    @Default([]) List<EventEntity> recommendedList,

  }) = _HomeState;
}
