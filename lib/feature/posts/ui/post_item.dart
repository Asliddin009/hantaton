import 'package:hantaton_app/feature/posts/domain/entity/post/post_entity.dart';
import 'package:hantaton_app/feature/posts/ui/detail_post_screen.dart';
import 'package:flutter/material.dart';

class PostItem extends StatelessWidget {
  const PostItem({super.key, required this.postEntity});

  final PostEntity postEntity;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => DetailPostScreen(id: postEntity.id.toString()),
        ));
      },
      child: Card(
        color: Colors.white,
        child: Column(
          children: [
            Text(postEntity.name),
            Text(postEntity.preContent ?? ""),
            Text("автор: ${postEntity.author?.id ?? ""}"),
          ],
        ),
      ),
    );
  }
}
