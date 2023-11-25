import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class LikeCategory extends StatefulWidget {
  const LikeCategory({super.key});

  @override
  State<LikeCategory> createState() => _LikeCategoryState();
}

class _LikeCategoryState extends State<LikeCategory> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              IconButton(
                  onPressed: () {

                  },
                  icon: Icon(Icons.arrow_back)
              )
            ],
          )
        ],
      ),
    );
  }
}
