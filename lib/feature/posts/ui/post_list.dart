import 'package:hantaton_app/app/ui/app_loader.dart';
import 'package:hantaton_app/feature/posts/domain/state/cubit/post_cubit.dart';
import 'package:hantaton_app/feature/posts/ui/post_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostList extends StatelessWidget {
  const PostList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PostBloc, PostState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state.postList.isNotEmpty) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: state.postList.length,
            itemBuilder: (context, index) {
              return PostItem(postEntity: state.postList[index]);
            },
          );
        }
        if (state.asyncSnapshot?.connectionState == ConnectionState.waiting) {
          return const AppLoader();
        }
        return const SizedBox.shrink();
      },
    );
  }
}
