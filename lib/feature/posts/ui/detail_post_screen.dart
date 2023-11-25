import 'package:hantaton_app/app/di/init_di.dart';
import 'package:hantaton_app/app/domain/error_entity/error_entity.dart';
import 'package:hantaton_app/app/ui/app_loader.dart';
import 'package:hantaton_app/app/ui/components/app_snack_bar.dart';
import 'package:hantaton_app/feature/posts/domain/entity/post/post_entity.dart';
import 'package:hantaton_app/feature/posts/domain/post_repo.dart';
import 'package:hantaton_app/feature/posts/domain/state/cubit/post_cubit.dart';
import 'package:hantaton_app/feature/posts/domain/state/detail_post/cubit/detail_post_cubit.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class DetailPostScreen extends StatelessWidget {
  const DetailPostScreen({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          DetailPostCubit(locator.get<PostRepo>(), id)..fetchPost(),
      child: const _DetailPostView(),
    );
  }
}

class _DetailPostView extends StatelessWidget {
  const _DetailPostView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                context.read<DetailPostCubit>().deletePost().then((_) {
                  context.read<PostBloc>().add(PostEvent.fetch());
                  Navigator.of(context).pop();
                });
              },
              icon: const Icon(Icons.delete))
        ],
      ),
      body: BlocConsumer<DetailPostCubit, DetailPostState>(
        builder: (context, state) {
          if (state.asyncSnapshot.connectionState == ConnectionState.waiting) {
            return const AppLoader();
          }

          if (state.postEntity != null) {
            return _DetailPostItem(
              postEntity: state.postEntity!,
            );
          }

          return const Center(
            child: Text("Ошибка данных"),
          );
        },
        listener: (context, state) {
          if (state.asyncSnapshot.hasData) {
            AppSnackBar.showSnackBarWithMessage(
                context, state.asyncSnapshot.data.toString());
          }
          if (state.asyncSnapshot.hasError) {
            AppSnackBar.showSnackBarWithError(
                context, ErrorEntity.fromException(state.asyncSnapshot.error));
            Navigator.of(context).pop();
          }
        },
      ),
    );
  }
}

class _DetailPostItem extends StatelessWidget {
  const _DetailPostItem({required this.postEntity});

  final PostEntity postEntity;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Text("Name: ${postEntity.name}"),
        Text("Content: ${postEntity.content}")
      ],
    );
  }
}
