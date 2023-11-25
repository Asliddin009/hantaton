// import 'dart:async';
//
// import 'package:hantaton_app/feature/auth/domain/auth_state/auth_cubit.dart';
// import 'package:hantaton_app/feature/posts/domain/post_repo.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:hydrated_bloc/hydrated_bloc.dart';
//
//
// part 'post_cubit.freezed.dart';
// part 'post_state.dart';
//
// class EventCubit extends Cubit<EventState> {
//   EventCubit(this.repo)
//       : super(const PostState(asyncSnapshot: AsyncSnapshot.nothing()));
//   final PostRepo repo;
//
//   // Future<void> fetchPosts() async {
//   //   emit(state.copyWith(asyncSnapshot: const AsyncSnapshot.waiting()));
//   //   await repo.fetchPosts(state.fetchLimit, state.offset).then((value) {
//   //     final Iterable iterable = value;
//   //     emit(state.copyWith(
//   //         postList: iterable.map((e) => PostEntity.fromJson(e)).toList(),
//   //         asyncSnapshot:
//   //             const AsyncSnapshot.withData(ConnectionState.done, true)));
//   //   }).catchError((error) {
//   //     stateError(error, emitter);
//   //   });
//   // }
//
//   // Future<void> createPost(PostEvent event, Emitter emitter) async {
//   //   await repo.createPost((event as _PostEventCreate).args).then((value) {
//   //     this.add(PostEvent.fetch());
//   //   }).catchError((error) {
//   //     stateError(error, emitter);
//   //   });
//   // }
//
//   void logOut() {
//     emit(const PostState());
//   }
//
//
//   void stateError(Object error, Emitter emitter) {
//     emitter(state.copyWith(
//         asyncSnapshot: AsyncSnapshot.withError(ConnectionState.done, error)));
//     addError(error);
//   }
// }
