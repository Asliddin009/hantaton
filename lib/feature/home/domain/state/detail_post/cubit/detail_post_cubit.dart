import 'package:hantaton_app/feature/posts/domain/entity/post/post_entity.dart';
import 'package:hantaton_app/feature/posts/domain/post_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'detail_post_state.dart';
part 'detail_post_cubit.freezed.dart';

class DetailPostCubit extends Cubit<DetailPostState> {
  DetailPostCubit(this.postRepo, this.id) : super(const DetailPostState());

  final PostRepo postRepo;
  final String id;

  Future<void> fetchPost() async {
    emit(state.copyWith(asyncSnapshot: const AsyncSnapshot.waiting()));
    await Future.delayed(const Duration(seconds: 1));
    await postRepo.fetchPost(id).then((value) {
      emit(state.copyWith(
          postEntity: value,
          asyncSnapshot: const AsyncSnapshot.withData(
              ConnectionState.done, "Успешное получение поста")));
    }).catchError((error) {
      addError(error);
    });
  }

  Future<void> deletePost() async {
    emit(state.copyWith(asyncSnapshot: const AsyncSnapshot.waiting()));
    await Future.delayed(const Duration(seconds: 1));
    await postRepo.deletePost(id).then((value) {
      emit(state.copyWith(
          asyncSnapshot: const AsyncSnapshot.withData(
              ConnectionState.done, "Успешное удаление поста")));
    }).catchError((error) {
      addError(error);
    });
  }

  @override
  void addError(Object error, [StackTrace? stackTrace]) {
    emit(state.copyWith(
        asyncSnapshot: AsyncSnapshot.withError(ConnectionState.done, error)));
    super.addError(error, stackTrace);
  }
}
