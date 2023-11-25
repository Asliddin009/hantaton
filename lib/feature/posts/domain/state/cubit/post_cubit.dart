import 'dart:async';

import 'package:hantaton_app/feature/auth/domain/auth_state/auth_cubit.dart';
import 'package:hantaton_app/feature/posts/domain/post_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../../entity/post/post_entity.dart';

part 'post_cubit.freezed.dart';
part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc(this.repo, this.authCubit)
      : super(const PostState(asyncSnapshot: AsyncSnapshot.nothing())) {
    authSub = authCubit.stream.listen((event) {
      event.mapOrNull(
        authorized: (value) => add(PostEvent.fetch()),
        notAuthorized: (value) => add(PostEvent.logout()),
      );
    });

    on<_PostEventFetch>(fetchPosts);
    on<_PostEventCreate>(createPost);
    on<_PostEventLogout>(logOut);
  }

  final PostRepo repo;
  final AuthCubit authCubit;
  late final StreamSubscription authSub;

  Future<void> fetchPosts(PostEvent event, Emitter emitter) async {
    emitter(state.copyWith(asyncSnapshot: const AsyncSnapshot.waiting()));
    await repo.fetchPosts(state.fetchLimit, state.offset).then((value) {
      final Iterable iterable = value;
      emitter(state.copyWith(
          postList: iterable.map((e) => PostEntity.fromJson(e)).toList(),
          asyncSnapshot:
              const AsyncSnapshot.withData(ConnectionState.done, true)));
    }).catchError((error) {
      stateError(error, emitter);
    });
  }

  Future<void> createPost(PostEvent event, Emitter emitter) async {
    await repo.createPost((event as _PostEventCreate).args).then((value) {
      this.add(PostEvent.fetch());
    }).catchError((error) {
      stateError(error, emitter);
    });
  }

  void logOut(PostEvent event, Emitter emitter) {
    emitter(const PostState());
  }

  @override
  Future<void> close() {
    authSub.cancel();
    return super.close();
  }

  void stateError(Object error, Emitter emitter) {
    emitter(state.copyWith(
        asyncSnapshot: AsyncSnapshot.withError(ConnectionState.done, error)));
    addError(error);
  }
}
