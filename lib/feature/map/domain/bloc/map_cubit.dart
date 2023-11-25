import 'package:geolocator/geolocator.dart';
import 'package:hantaton_app/feature/map/domain/entity/market_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';

part 'map_cubit.freezed.dart';

part 'map_state.dart';

@Singleton()
class MapCubit extends Cubit<MapState> {
  MapCubit() : super(const MapState(asyncSnapshot: AsyncSnapshot.waiting()));

  void stateError(Object error, Emitter emitter) {
    emitter(state.copyWith(
        asyncSnapshot: AsyncSnapshot.withError(ConnectionState.done, error)));
    addError(error);
  }

  void initState() async {
    try{
      emit(state.copyWith(asyncSnapshot: const AsyncSnapshot.waiting()));
      determinePosition().then((positionResult) {
        emit(state.copyWith(
            latitude: positionResult.latitude,
            longitude: positionResult.longitude,
            asyncSnapshot:
            const AsyncSnapshot.withData(ConnectionState.done, null)));
      });
    }catch(error){
      emit(state.copyWith(
          latitude:55.755793,
          longitude:37.617134,
          asyncSnapshot: AsyncSnapshot.withError(ConnectionState.done, error)));
    }
   }

  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }
}
