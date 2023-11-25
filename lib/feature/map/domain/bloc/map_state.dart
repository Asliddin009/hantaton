part of 'map_cubit.dart';


@freezed
class MapState with _$MapState {
  const factory MapState({
    @JsonKey(ignore: true) AsyncSnapshot? asyncSnapshot,
    @Default([]) List<MarkerEntity> markerList,
    @Default(0) double latitude,
    @Default(0) double longitude,
  }) = _PostState;
}
