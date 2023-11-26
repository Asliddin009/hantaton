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

    emit(state.copyWith(
        categoryList: mockHomeRepo.fetchCategories(),
        eventList: mockHomeRepo.feachEvent(),
        asyncSnapshot: const AsyncSnapshot.waiting()));
    await Future.delayed(const Duration(seconds: 4));
    //todo сделать запрос
    emit(state.copyWith(
      asyncSnapshot: const AsyncSnapshot.withData(ConnectionState.done, null)
    ));
    //final response = await repo.fetchCategories();
    //final Iterable iterable1 = response;
  }


// Future<void> createPost(PostEvent event, Emitter emitter) async {
//   await repo.createPost((event as _PostEventCreate).args).then((value) {
//     this.add(PostEvent.fetch());
//   }).catchError((error) {
//     stateError(error, emitter);
//   });
// }

void logOut() {
  emit(const HomeState());
}


void stateError(Object error, Emitter emitter) {
  emitter(state.copyWith(
      asyncSnapshot: AsyncSnapshot.withError(ConnectionState.done, error)));
  addError(error);
}}
