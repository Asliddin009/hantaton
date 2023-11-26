import 'package:hantaton_app/feature/home/data/mock_home_repo.dart';
import 'package:hantaton_app/feature/home/domain/entity/category/category_entity.dart';
import 'package:hantaton_app/feature/home/domain/entity/event/event_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../home_repo.dart';


part 'home_cubit.freezed.dart';

part 'home_state.dart';

@Singleton()
class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.repo)
      : super(const HomeState(asyncSnapshot: AsyncSnapshot.nothing()));
  final HomeRepo repo;

  MockHomeRepo mockHomeRepo=MockHomeRepo();
  Future<void> init() async {
  try{
    emit(state.copyWith(
        categoryList: mockHomeRepo.fetchCategories(),
        eventList: mockHomeRepo.feachEvent(),
        asyncSnapshot: const AsyncSnapshot.waiting()));
    await Future.delayed(const Duration(seconds: 2));
    final response = await repo.getRecommendation();

    emit(state.copyWith(
      recommendedList: response,
        asyncSnapshot: const AsyncSnapshot.withData(ConnectionState.done, null)
    ));
  }catch(error){
    emit(state.copyWith(
        categoryList: mockHomeRepo.fetchCategories(),
        eventList: mockHomeRepo.feachEvent(),
        asyncSnapshot: const AsyncSnapshot.withData(ConnectionState.done, null)));
  }

  }


Future<void> createEvent(Map<String,Object> data) async {
  try{
    await repo.createEvent(data);
  }catch(error){

  }

  }


void logOut() {
  emit(const HomeState());
}


void stateError(Object error, Emitter emitter) {
  emitter(state.copyWith(
      asyncSnapshot: AsyncSnapshot.withError(ConnectionState.done, error)));
  addError(error);
}}
